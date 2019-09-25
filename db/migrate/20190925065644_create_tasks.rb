class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :status
      t.integer :simulations_count
      t.string :eta
      t.text :report
      t.string :config
      t.text :config_json
      t.string :benchmark_version
      t.boolean :report_table
      t.boolean :report_distribution
      t.boolean :report_graph
      t.boolean :report_w1
      t.boolean :report_dragons
      t.float :progress
      t.string :line_count
      t.string :bet_per_line
      t.string :currency
      t.integer :worker_id
      t.integer :threads

      t.timestamps
    end
  end
end
