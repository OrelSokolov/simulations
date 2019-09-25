require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { benchmark_version: @task.benchmark_version, bet_per_line: @task.bet_per_line, config: @task.config, config_json: @task.config_json, currency: @task.currency, eta: @task.eta, line_count: @task.line_count, progress: @task.progress, report: @task.report, report_distribution: @task.report_distribution, report_dragons: @task.report_dragons, report_graph: @task.report_graph, report_table: @task.report_table, report_w1: @task.report_w1, simulations_count: @task.simulations_count, status: @task.status, threads: @task.threads, worker_id: @task.worker_id } }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { benchmark_version: @task.benchmark_version, bet_per_line: @task.bet_per_line, config: @task.config, config_json: @task.config_json, currency: @task.currency, eta: @task.eta, line_count: @task.line_count, progress: @task.progress, report: @task.report, report_distribution: @task.report_distribution, report_dragons: @task.report_dragons, report_graph: @task.report_graph, report_table: @task.report_table, report_w1: @task.report_w1, simulations_count: @task.simulations_count, status: @task.status, threads: @task.threads, worker_id: @task.worker_id } }
    assert_redirected_to task_url(@task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end
end
