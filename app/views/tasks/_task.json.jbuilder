json.extract! task, :id, :status, :simulations_count, :eta, :report, :config, :config_json, :benchmark_version, :report_table, :report_distribution, :report_graph, :report_w1, :report_dragons, :progress, :line_count, :bet_per_line, :currency, :worker_id, :threads, :created_at, :updated_at
json.url task_url(task, format: :json)
