class AddBusyStateToWorker < ActiveRecord::Migration[6.0]
  def change
    add_column :workers, :busy, :boolean, default: false
  end
end
