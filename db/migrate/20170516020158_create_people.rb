class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :lastname
      t.string :firstname
      t.string :middle
      t.string :pet
      t.string :birthday
      t.string :color

      t.timestamps
    end
  end
end
