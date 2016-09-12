class ItemsController < ApplicationController
	before_action :get_item, only: [:edit, :destroy, :show, :update]
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
	end

	def get_item
		@item = Item.find(params[:id])
	end

	def index
		@items = Item.all
		if params[:search]
			@items = Item.search(params[:search])
		else
			@items = Item.all
		end
	end

	def new
		@item = Item.new
	end

	def show
	end

	def update
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
