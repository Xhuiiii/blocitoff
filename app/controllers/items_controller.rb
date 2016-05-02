class ItemsController < ApplicationController
	before_action :authenticate_user!

	def create
		@user = current_user
	  	@item = @user.items.create(item_params)

	  	if @item.save
	  		flash[:notice] = "Item was saved."

     	respond_to do |format|
	       format.html
	       format.js
	     end
	  	else
	  		flash.now[:alert] = "There was an error saving the item. Please try again later."

	  	 respond_to do |format|
	       format.html
	       format.js
	     end 		
	  	end
	end

	def destroy
		@item = Item.find(params[:id])
		if @item.destroy
			flash[:notice] = "Item was destroyed."

	     respond_to do |format|
	       format.html
	       format.js
	     end
		else 
			flash.now[:alert] = "There was an error deleting the item. Please try again."

	     respond_to do |format|
	       format.html
	       format.js
	     end
		end
	end

	private 
	def item_params
		params.require(:item).permit(:name)
	end
end
