class AddPrecChanceToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :precipitation_chance, :integer
  end
end
