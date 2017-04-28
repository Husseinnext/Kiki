class ListingsController < ApplicationController
    def index
      @listing =Listing.new
      @listings = Listing.all
    end

    def create
     @listings = current_user.listings.new(listing_params)
      if @listings.save
         redirect_to root_path, notice: 'created'
      else
         redirect_to root_path, notice: 'good luck in the next listing'
      end
    end

    def new
    @listing = Listing.new
    end

    def update
       @listing.update(listing_params)
       @listing.user_id = current_user.id
       redirect_to @listing
    end

    def edit
    end

    def show
    @listings = Listing.find(params[:id])
    end

    def delete
    end

  def listing_params
    params.require(:listing).permit(:specifications, :cost, :country)
  end
end
