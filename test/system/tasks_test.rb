require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:one)
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Tasks"
  end

  test "creating a Task" do
    visit tasks_url
    click_on "New Task"

    fill_in "Benchmark version", with: @task.benchmark_version
    fill_in "Bet per line", with: @task.bet_per_line
    fill_in "Config", with: @task.config
    fill_in "Config json", with: @task.config_json
    fill_in "Currency", with: @task.currency
    fill_in "Eta", with: @task.eta
    fill_in "Line count", with: @task.line_count
    fill_in "Progress", with: @task.progress
    fill_in "Report", with: @task.report
    check "Report distribution" if @task.report_distribution
    check "Report dragons" if @task.report_dragons
    check "Report graph" if @task.report_graph
    check "Report table" if @task.report_table
    check "Report w1" if @task.report_w1
    fill_in "Simulations count", with: @task.simulations_count
    fill_in "Status", with: @task.status
    fill_in "Threads", with: @task.threads
    fill_in "Worker", with: @task.worker_id
    click_on "Create Task"

    assert_text "Task was successfully created"
    click_on "Back"
  end

  test "updating a Task" do
    visit tasks_url
    click_on "Edit", match: :first

    fill_in "Benchmark version", with: @task.benchmark_version
    fill_in "Bet per line", with: @task.bet_per_line
    fill_in "Config", with: @task.config
    fill_in "Config json", with: @task.config_json
    fill_in "Currency", with: @task.currency
    fill_in "Eta", with: @task.eta
    fill_in "Line count", with: @task.line_count
    fill_in "Progress", with: @task.progress
    fill_in "Report", with: @task.report
    check "Report distribution" if @task.report_distribution
    check "Report dragons" if @task.report_dragons
    check "Report graph" if @task.report_graph
    check "Report table" if @task.report_table
    check "Report w1" if @task.report_w1
    fill_in "Simulations count", with: @task.simulations_count
    fill_in "Status", with: @task.status
    fill_in "Threads", with: @task.threads
    fill_in "Worker", with: @task.worker_id
    click_on "Update Task"

    assert_text "Task was successfully updated"
    click_on "Back"
  end

  test "destroying a Task" do
    visit tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Task was successfully destroyed"
  end
end
