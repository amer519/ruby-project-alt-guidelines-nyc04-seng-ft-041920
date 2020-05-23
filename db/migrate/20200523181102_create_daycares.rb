class CreateDaycares < ActiveRecord::Migration[5.2]
  def change
    create_table :daycares do |t|
      t.string :name
      t.string :address
      t.datetime :open
      t.datetime :closed
    end
  end
end
