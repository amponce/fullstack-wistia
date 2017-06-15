class ChangeDefaultBirthday < ActiveRecord::Migration[5.0]
  def up
    remove_column :people, :birthday
    add_column :people, :birthday, :datetime
  end

  def down
    remove_column :people, :birthday
    add_column :people, :birthday, :string
  end
end
