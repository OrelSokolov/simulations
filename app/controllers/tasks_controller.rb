class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:new_task_for_worker, :update_task]
  skip_before_action :verify_authenticity_token, only: [:new_task_for_worker, :update_task]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    @tasks_todo = Task.todo
    @tasks_progress = Task.in_progress.order(progress: :desc)
    @tasks_done = Task.done.order(updated_at: :desc)
    @done_today = @tasks_done.select{|t| t.changed_today? }
    @done_yesterday = @tasks_done.select{|t| t.changed_yesterday? }
    @done_this_week = @tasks_done.select{|t| t.changed_this_week? }
    @done_ago = @tasks_done.select{|t| t.changed_ago? }
    @tasks_failed = @tasks.select{|t| t.failed?}.sort_by{|t| t.updated_at || Time.unix(0) }.reverse

    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new({
        benchmark_version: "Any",
        status: :todo,
        report_table: true,
        report_distribution: true,
        threads: 20
    })
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_task_for_worker
    if validate_token
      response.content_type = "application/json"
      worker = Worker.find_by(name: pick_params[:worker])
      if worker.nil?
        worker = Worker.create!(name: pick_params[:worker])
      end
      tasks = Task.where("(worker_id IS NULL OR worker_id = #{worker.id}) AND status = 0").limit("1")
      if tasks.length > 0
        task = tasks.first
        task.update!(worker_id: (worker.id || 0))
        task.save
        render json: task.to_json
      else
        render json: "null"
      end
    else
      render json: { error: "Token invalid" }.to_json
    end
  end

  def update_task
    if validate_token
      task = Task.find(update_params[:id])
      puts task
      task && task.update!(update_params)
        render json: task.to_json
    else
        render json: { error: "Forbidden" }
    end
  end

  def retry
    new_task = task.dup
    new_task.created_at = Time.now
    new_task.updated_at = Time.now
    new_task.id = nil
    new_task.status = 0
    new_task.worker_id = nil
    if new_task.save
      redirect_to action: :index, flash: {"success" => "Created task successfully."}
    else
      flash[:danger] = "Could not create Task!"
      render "new.slang"
    end
  end

  private
    def validate_token
      params.permit(:token, :worker) && params.has_key?(:token) && params[:token] == "booming-games"
    end

  def update_params
    params.require(:task).permit(:id, :progress, :status, :report, :eta, :token, :task)
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def pick_params
      params.permit(:worker, :token)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:status, :simulations_count, :eta, :report, :config, :config_json, :benchmark_version, :report_table, :report_distribution, :report_graph, :report_w1, :report_dragons, :progress, :line_count, :bet_per_line, :currency, :worker_id, :threads)
    end
end
