class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :load_workers_data

  def load_workers_data
    @free_workers = Worker.available.count
    @active_workers = Worker.active.count
  end
end
