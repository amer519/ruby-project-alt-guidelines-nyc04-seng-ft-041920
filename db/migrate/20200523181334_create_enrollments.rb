class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|
      t.integer :child_id
      t.integer :daycare_id
      t.boolean :enrolled
    end 
  end
end
