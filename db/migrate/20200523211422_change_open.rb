class ChangeOpen < ActiveRecord::Migration[5.2]
  def change
    change_column :daycares, :open, :string
    change_column :daycares, :closed, :string

  end
end
