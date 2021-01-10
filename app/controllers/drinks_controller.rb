class DrinksController < ApplicationController

def new
  	@drink = Drink.new
  end

  def create
  	drink = Drink.new(drink_params)
  	drink.save
  	redirect_to drinks_path
  end

  def index
  	@drink = Drink.all
	@genres = Genre.all
		# urlにcategory_id(params)がある場合
        if params[:genre_id]
		    # Categoryのデータベースのテーブルから一致するidを取得
		    @genre = Genre.find(params[:genre_id])
		    # category_idと紐づく投稿を取得
		    @drinks = @genre.drinks.order(created_at: :desc).all.page(params[:page]).per(8)
		else
		    # 投稿すべてを取得
	        @drinks = Drink.order(created_at: :desc).all.page(params[:page]).per(8)
    	end
  end

  def show
  	@drink = Drink.find(params[:id])
  end

  def edit
  	@drink = Drink.find(params[:id])
  end

  def update
  	drink = Drink.find(params[:id])
  	drink.update(drink_params)
  	redirect_to drink_path(drink.id)
  end

  def destroy
  	@drink = Drink.find(params[:id])
  	@drink.destroy
  	redirect_to drinks_path
  end

  private
  	def drink_params
  	params.require(:drink).permit(:drink_name, :image, :body, :genre_id )
  	end
end
