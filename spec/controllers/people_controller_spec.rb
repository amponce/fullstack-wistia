require 'rails_helper'

RSpec.describe PeopleController, type: :controller do

  let(:import_data_file) { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'import_data.txt')) }

  it 'get index page' do
    get :index
    expect(response).to have_http_status(200)
  end

  it 'import data' do
    post :import, params: {file: import_data_file}
    expect(response).to have_http_status(302)
    expect(response).to redirect_to(root_path)

    get :index, params: {direction: 'desc', sort: 'firstname'}
    expect(response).to have_http_status(200)

  end

end
