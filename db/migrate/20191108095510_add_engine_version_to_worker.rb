class AddEngineVersionToWorker < ActiveRecord::Migration[6.0]
  def change
    add_column :workers, :engine_version, :string
  end
end
