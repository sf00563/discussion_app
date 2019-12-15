class Discussion < ApplicationRecord
  #assocaiations
  belongs_to :discussion_topic
  belongs_to :user
  has_many :comments, -> { where('created_at > ?', Time.current - 2.weeks) } , dependent: :destroy
  #validation
  validates :title, :content, presence: true

end
