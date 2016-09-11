class ItemsController < ApplicationController

	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
	def create
		@item = Item.new(item_params)

		if @item.save
			redirect_to @item
		else
			render 'new'
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destoy

		redirect_to items_path
	end

	def edit
		@item = Item.find(params[:id])
	end

	def index
		@items = Item.all
	end

	def new
		@item = Item.new
	end

	def show
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])

		if @item.update(item_params)
			redirect_to @item
		else
			render 'edit'
		end
	end

	private
		def item_params
			params.require(:item).permit(:title, :description)
		end
end
