class DeleteColumnEnrolledJoiner < ActiveRecord::Migration[5.2]
  def change
    remove_column :enrollments, :enrolled
  end
end
