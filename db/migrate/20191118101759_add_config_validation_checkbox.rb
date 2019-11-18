class AddConfigValidationCheckbox < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :config_validation, :boolean, default: true
  end
end
