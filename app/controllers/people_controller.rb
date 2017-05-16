class PeopleController < ApplicationController

  include PeopleHelper

  helper_method :sort_column, :sort_direction

  def index

    @people = Person.all
                     .search(person_params[:search])
                     .order(sort_column + " " + sort_direction)
                     .paginate(:per_page => 3, :page => person_params[:page])
  end

  def import
    # Validate inputs with block
    begin
      file = person_params[:file]
      file_path = file.path
      Person.import(file_path)
      redirect_to root_url, notice: "Person imported."
    rescue
      redirect_to root_url, notice: "Invalid CSV file format."
    end
  end

  private

  def sort_column
    Person.column_names.include?(person_params[:sort]) ? person_params[:sort] : "lastname"
  end

  def sort_direction
    %w[asc desc].include?(person_params[:direction]) ? person_params[:direction] : "asc"
  end

  # allow the white list.
  def person_params
    params.permit(:lastname, :firstname, :middle, :pet, :birthday, :color)
  end
end
