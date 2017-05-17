class AddDefaultValueToPerson < ActiveRecord::Migration[5.0]
  def change
    change_column_default :people, :pet, 'none'
    change_column_default :people, :middle, 'none'
  end
end
