class DrinksController < ApplicationController
def new
  	@drink = Drink.new
  end
  def create
  	drink = Drink.new(drink_params)
  	drink.save
  	redirect_to drinks_path
  end
  private
  	def drink_params
  	params.require(:drink).permit(:drink_name, :image, :body, :genre_id )
  	end
end
