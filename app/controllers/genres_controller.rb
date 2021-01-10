class GenresController < ApplicationController

	def new
		@genre = Genre.new
	end
	def create
		genre = Genre.new(genre_params)

		#####
		genre_check = Genre.find_by(name: genre.name)
		if genre_check == nil
			# 名前が存在しない
			genre.save
			redirect_to drinks_path
		else
			# 名前がすでに存在する
			# なんかえらーの処理
			flash[:error] = "すでに存在するジャンルです。"
			redirect_to new_genre_path
		end
	end

	private
  	def genre_params
  	params.require(:genre).permit(:name)
  	end
end
