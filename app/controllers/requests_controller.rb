class RequestsController < ApplicationController
	http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

	def create
		@item = Item.find(params[:item_id])
		@request = @item.requests.create(request_params)
		redirect_to item_path(@item)
	end

	def destroy
		@item = Item.find(params[:item_id])
		@request = @item.requests.find(params[:id])
		@request.destroy

		redirect_to item_path(@item)
	end

	private
		def request_params
			params.require(:request).permit(:requester, :body)
		end
end
