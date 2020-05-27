class DeleteEnrollment < ActiveRecord::Migration[5.2]
  def change
    remove_column :children, :enrolled
  end
end
