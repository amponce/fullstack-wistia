json.extract! person, :id, :lastname, :firstname, :middle, :pet, :birthday, :color, :created_at, :updated_at
json.url person_url(person, format: :json)
