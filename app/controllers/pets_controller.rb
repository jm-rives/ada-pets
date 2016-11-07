class PetsController < ApplicationController
  # this want to render HTML, but we are using JSON and don't want HTML
  def index
    pets = Pet.all
    # or pets = Pet.select(:name, :id, :human, :age)
    # will not render ruby

    render :json => pets, :status => :ok # pets.as_json(:only => [:id, :name, :human, :age])
    # status code in ruby are used by key e.g. 403 == :forbidden
  end

  def search # works as desired but breaks tests
    mypet = Pet.where(name: params[:query])
    unless mypet.empty?
      render :json => mypet.as_json(:only => [:id, :name, :human, :age]), :status => :ok
    else
      render :json => mypet, :status => :no_content
    end
  end

  def show
    # local variable as not passed to a view in this program

    # .find will throw an exception, find_by will not
    mypet = Pet.find(id: params[:id])

    if mypet
      render :json => mypet, :status => :ok
    else
      render :json => [], :status => :no_content
    end
  end

  
end

#pets/search?query=Peanut