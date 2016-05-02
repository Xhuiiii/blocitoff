class ItemsController < ApplicationController
	before_action :authenticate_user!

	def create
		@user = current_user
	  	@item = @user.items.create(item_params)

	  	if @item.save
	  		flash[:notice] = "Item was saved."

	  		respond_to do |format|
  				format.js {render inline: "location.reload();" }
			end
	  	else
	  		flash.now[:alert] = "There was an error saving the item. Please try again later."

	  		respond_to do |format|
  				format.js {render inline: "location.reload();" }
			end	  		
	  	end
	end

	def destroy
		@user = User.find(params[:user_id])
		@item = Item.find(params[:id])
		@item.destroy
	end

	private 
	def item_params
		params.require(:item).permit(:name)
	end
end
