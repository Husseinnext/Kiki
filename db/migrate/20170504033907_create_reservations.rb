class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.string :start_date
      t.string :end_date
      t.references :user,  foreign_key: true
      t.references :listing,  foreign_key: true
      t.timestamps
    end
  end

  def available?
          self.errors.add(:start_date, “You can only make reservations from #{Date.today} onwards.“) if self.end_date < Date.today
          active_res = Reservation.where(‘start_date >= ? OR end_date >= ?‘, Date.today, Date.today)
          active_res.each do |booking|
              if (self.start_date..self.end_date).overlaps?(booking.start_date..booking.end_date)
                  self.errors.add(:start_date, “There’s an overlap on your start date or your end date”)
                  # errors.add(:end_date, “There’s an overlap on your end date”)
              end
          end
      end


end
