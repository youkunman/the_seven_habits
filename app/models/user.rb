class User < ApplicationRecord
	attachment :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :name,  length: { maximum: 10 }
  validates :hobby,  length: { maximum: 20 }
  validates :introduction,  length: { maximum: 10 }




  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
  false
  end


  has_many :habits, dependent: :destroy
  has_many :experiences, dependent: :destroy


end



