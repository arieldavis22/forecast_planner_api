class RemoveTimeColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :time
  end
end
