class AddEngineVersionToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :engine_version, :string
  end
end
