class AddWorkerVersionToWorker < ActiveRecord::Migration[6.0]
  def change
    add_column :workers, :worker_version, :string
  end
end
