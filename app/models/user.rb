class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart 
  # has_many :carts 

  has_many :games
  has_many :items, through: :cart

  after_create :welcome_send

    def welcome_send
      UserMailer.welcome_email(self).deliver_now
     end 
end
