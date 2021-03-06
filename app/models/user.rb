class User < ApplicationRecord

  has_many :reviews, dependent: :destroy

  has_secure_password

  validates :email, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password, length: { in: 6..20 }, on: :create

  def fullname
    "#{firstname} #{lastname}"
  end
  
end
