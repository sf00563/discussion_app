class Discussion < ApplicationRecord
  validates :title, :content, presence: true
  validates_uniqueness_of :title, scope: :discussion_topic_id
end
