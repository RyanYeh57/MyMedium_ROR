class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # relationships
  has_many :stories
  has_many :comments
  has_one_attached :avatar

  # validations
  validates :username, presence: true, uniqueness: true
end
