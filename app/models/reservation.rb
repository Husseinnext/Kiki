class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validate :check_overlapping_dates

  def check_overlapping_dates
    listing.Reservations.each do |old_reservation|
      if overlap?(self, old_reservation)
       return errors.add(:overlapping_dates, "those days are taken")
      end
    end
  end

 def overlap?(x,y)
   (x.start_date - y.end_day) * (y.start_date - x.end_day) > 0
 end


def total_price
  price = listing.cost
  num_dates = (start_date..end_date).to_a.length
return price * num_dates
end 


end
