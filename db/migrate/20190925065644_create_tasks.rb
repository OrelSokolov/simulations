class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :status, null: false, default: 0
      t.integer :simulations_count, null: false, default: 0
      t.string :eta,  null: false, default: 0
      t.text :report, null: false,  default: ""
      t.string :config, null: false,  default: ""
      t.text :config_json, null: false,  default: ""
      t.string :benchmark_version, null: false,  default: ""
      t.boolean :report_table,  null: false, default: false
      t.boolean :report_distribution, null: false,  default: false
      t.boolean :report_graph,  null: false, default: false
      t.boolean :report_w1, null: false,  default: false
      t.boolean :report_dragons, null: false,  default: false
      t.float :progress, null: false,  default: 0
      t.string :line_count,  null: false, default: "1"
      t.string :bet_per_line,  null: false, default: "1"
      t.string :currency,  null: false, default: "EUR"
      t.integer :worker_id
      t.integer :threads, default: 20

      t.timestamps
    end
  end
end
