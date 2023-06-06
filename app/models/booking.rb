class Booking < ApplicationRecord
	belongs_to :user
	belongs_to :camera

	validates :user_id, :camera_id, :start_date, :end_date, presence: true
	validate :valid_date_range
	validate :no_overlapping_bookings
	validate :start_date_in_future
	validate :cannot_book_own_camera

	def valid_date_range
		if start_date && end_date && start_date > end_date
		errors.add(:start_date, "must be before the end date")
		end
	end

	def no_overlapping_bookings
		overlapping_bookings = Booking.where(camera_id: camera_id)
									.where.not(id: id)
									.where("(? BETWEEN start_date AND end_date) OR (? BETWEEN start_date AND end_date) OR (start_date BETWEEN ? AND ?) OR (end_date BETWEEN ? AND ?)", start_date, end_date, start_date, end_date, start_date, end_date)

		if overlapping_bookings.exists?
			errors.add(:base, "This camera is already booked for the selected dates.")
		end
	end


	def start_date_in_future
		if start_date && start_date < Date.today
		errors.add(:start_date, "must be in the future")
		end
	end

	def cannot_book_own_camera
		if user_id == camera.user_id
			errors.add(:user_id, "cannot book own camera")
		end
	end
end
