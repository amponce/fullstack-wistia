class Person < ActiveRecord::Base
  require 'csv'

  def self.import(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      person_hash = row.to_hash
      person = Person.where(id: person_hash["id"])

      if person.count == 1
        # Prevent CSV updates from changing the database comments attribute
        person.first.update_attributes(person_hash.expect("comments"))
      else
        Person.create!(person_hash)
      end
    end
  end

  def self.search(search)
    if search
      where('lastname LIKE ?', "%#{search}%")
    else
      where(nil)
    end
  end

end
