class Habit < ApplicationRecord
	belongs_to :user
	has_many :experiences, dependent: :destroy
	validate :check_number_of_habits
	validates :habit_name, presence: true
	validates :habit_name,	length: { maximum: 30 }

	def check_number_of_habits
		if user && user.habits.count > 6
	 		errors.add(:habit_name, "が制限を超えています。")
	 	end
	end

	def experiences_user(user_id)
		range = Date.today.beginning_of_day..Date.today.end_of_day
  		experiences.find_by(user_id: user_id, created_at: range)
   	end
end

