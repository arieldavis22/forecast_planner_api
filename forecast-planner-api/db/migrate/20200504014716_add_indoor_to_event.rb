class AddIndoorToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :indoor, :boolean
  end
end
