# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  lastname   :string
#  firstname  :string
#  middle     :string
#  pet        :string
#  birthday   :string
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Person < ActiveRecord::Base

  class << self
    def import(file_path)
      File.foreach(file_path) do |line|
        if line.include?(',')
          columns = line.split(',')
          if columns.count == 5
            #LastName,FirstName,Pet,FavoriteColor,DateOfBirth
            person = Person.find_or_create_by!(lastname: columns[0], firstname: columns[1])
            person.update(pet: columns[2], color: columns[3], birthday: columns[4])
          end
        elsif line.include?('|')
          columns = line.split('|')
          if columns.count == 6
            #LastName|FirstName|MiddleInitial|Pet|FavoriteColor|DateOfBirth
            person = Person.find_or_create_by!(lastname: columns[0], firstname: columns[1])
            person.update(middle: columns[2], pet: columns[3], color: columns[4], birthday: columns[5])
          end
        elsif line.include?(' ')
          columns = line.split(' ')
          if columns.count == 6
            #LastName FirstName MiddleInitial Pet DateOfBirth FavoriteColor
            person = Person.find_or_create_by!(lastname: columns[0], firstname: columns[1])
            person.update(middle: columns[2], pet: columns[3], birthday: columns[4], color: columns[5])
          end
        end
      end
    end

    def search(key)
      if key
        where('lastname LIKE ?', "%#{key}%")
      else
        where(nil)
      end
    end
  end

end
