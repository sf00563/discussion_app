class Comment < ApplicationRecord
  #associations
  belongs_to :discussion
  belongs_to :user
  #validation
  validates :comment, presence: true
end
