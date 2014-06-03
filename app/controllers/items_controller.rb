class ItemsController < ApplicationController
	
	
	def show 
		@item = Item.find(params[:id])
	end

	def index
		@items = Item.all
	end	
	
	def new
		@item = Item.new
		@photos = @item.photos.build
	end

	def create
		uploader = AvatarUploader.new
		@item = Item.create(item_params)
		# flash[:success] = item_params
		
		# redirect_to 'merchants/index'
		if @item.save
			params[:photos]['avatar'].each do |photo|
				@photo = @item.photos.create!(avatar: photo, item_id: @item.id)

			end
			flash[:success] = "New item successfully saved"
			render 'new'
		else
			flash[:danger] = "Could not save item #{@item.errors.full_messages}"
			redirect_to :back
		end
	end


	private
		def item_params
			params.require(:item).permit(:available, :description, :name, :price, :shop_id, :size, post_attributes: [:id, :item_id, :avatar])
		end
end
