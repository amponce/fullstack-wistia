class ChangeDefaultValueInPerson < ActiveRecord::Migration[5.0]
  def change
    change_column_default :people, :pet, 'None'
    change_column_default :people, :middle, 'None'
  end
end
