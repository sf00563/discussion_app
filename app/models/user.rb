#user model genereated by devise, password email validation already handled so
#only added in validation of name
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :discussions, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
end
