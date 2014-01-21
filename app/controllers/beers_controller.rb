class BeersController < ApplicationController
before_filter :authenticate_user!, :except => [:index, :show] 
helper_method :sort_column, :sort_direction
 
def show
@beers = Beer.find(params[:id])
@comment= Comment.new
end


def index
  respond_to do |format|
    format.html
    format.json { render json: BeersDatatable.new(view_context) }
  end
end


def new
 @beer=Beer.new
end

def create
 @beer=Beer.new(allowed_params)
 @beer.save
end

#only let this method be accessible within this specific class
private
def allowed_params
  params.require(:beer).permit(:title, :category, :rating, :country, :state_or_province)
end


end