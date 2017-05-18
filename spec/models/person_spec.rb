# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  lastname   :string
#  firstname  :string
#  middle     :string           default("None")
#  pet        :string           default("None")
#  birthday   :string
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Person, type: :model do

  it "import a CSV File" do
    file_path = Rails.root.join('spec', 'fixtures', 'import_data.txt')
    expect(Person.count).to eq(0)
    Person.import(file_path)

    pipe_person = Person.find_by(firstname: 'Yoshie', lastname: 'Runyon')
    expect(pipe_person.color).to eq('Red')

    comma_person = Person.find_by(firstname: 'Shalonda', lastname: 'Radican')
    expect(comma_person.color).to eq('Turquoise')

    space_person = Person.find_by(firstname: 'Cacioppo', lastname: 'Doloris')
    expect(space_person.color).to eq('Red')

    expect(Person.count).to eq(9)
  end
end
