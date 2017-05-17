class PeopleController < ApplicationController

  include PeopleHelper

  helper_method :sort_column, :sort_direction

  def index

    @people = Person.all
                     .order(sort_column + " " + sort_direction)
                     .paginate(:per_page => 5, :page => params[:page])
  end

  def import
    Person.import(params[:file].path)
    redirect_to root_url, notice: "Person imported."
  end

  private

  def sort_column
    Person.column_names.include?(params[:sort]) ? params[:sort] : "lastname"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  # allow the white list.
  def person_params
    params.permit(:lastname, :firstname, :middle, :pet, :birthday, :color)
  end
end
