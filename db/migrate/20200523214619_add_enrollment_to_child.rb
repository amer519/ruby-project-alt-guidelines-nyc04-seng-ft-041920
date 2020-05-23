class AddEnrollmentToChild < ActiveRecord::Migration[5.2]
  def change
    add_column :children, :enrolled, :string
  end
end
