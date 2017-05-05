class ReservationsController < ApplicationController



    def index
      @reservation = Reservation.where(user_id: current_user.id)
      @reservations = Reservation.all 
    end

    def create
     @reservation = current_user.reservations.new(reservation_params)
     @reservation.listing_id = params[:listing_id]
      if @reservation.save
         redirect_to "/listings/#{params[:listing_id]}", notice: 'confirm'
      else
        @errors = @reservation.error.full_messages
         redirect_to '/listings', notice: 'there are plenty other rooms'
      end
    end

    def new
      @listing = Listing.find(params[:listing_id])
      @reservation = Reservation.new
    end

    def edit
    	@reservation = Reservation.find(params[:id])
  	end

  	def update
      @reservation = Reservation.find(params[:id])
        if @reservation.update(reservation_params)
          redirect_to @reservation
        else
          render 'edit'
        end
    end


    def show
    @reservation = Reservation.find(params[:id])
    end

    def destroy
      @reservation = Reservation.find(params[:id])
      @reservation.destroy
      redirect_to @reservation.user
    end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
