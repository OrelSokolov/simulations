class AddStateToWorker < ActiveRecord::Migration[6.0]
  def change
    add_column :workers, :blocked, :boolean, default: false
  end
end
