class Experience < ApplicationRecord
	belongs_to :user
	belongs_to :habit
	validates :user_id, presence: true
end
