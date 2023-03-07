class RenameContactAddAlternateContactToStudents < ActiveRecord::Migration[6.1]
  def change
    rename_column :students, :contact, :permanent_contact
    add_column :students, :alternate_contact, :string
  end
end
