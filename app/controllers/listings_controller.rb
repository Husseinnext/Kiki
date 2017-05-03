class ListingsController < ApplicationController
    def index
      @listing =Listing.new
      @listings = Listing.all
    end

    def create
     @listings = current_user.listings.new(listing_params)
      if @listings.save
         redirect_to '/listings', notice: 'created'
      else
         redirect_to '/listings', notice: 'good luck in the next listing'
      end
    end

    def new
      @listing = Listing.new
    end

    def edit
    	@listing = Listing.find(params[:id])
  	end

  	def update
      @listing = Listing.find(params[:id])
        if @listing.update(listing_params)
          redirect_to @listing # '/listings/:id'
        else
          render 'edit'
        end
    end


    def show
    @listing = Listing.find(params[:id])
    end

    def delete
    end

  def listing_params
    params.require(:listing).permit(:specifications, :cost, :country, {:tag_ids => []}, {:photos => []} )
  end
end
