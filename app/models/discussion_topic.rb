class DiscussionTopic < ApplicationRecord

  #associations
  has_many :discussions
  #validation
  validates :topic, presence: true
  validate :topic, :topic_starts_with_capital_letter
  #custom validation making sure first letter of topic starts with capital
  def topic_starts_with_capital_letter
    if (self.topic) && (self.topic.chr != self.topic.chr.capitalize)
      errors.add(:topic, "Must start with a capital letter")
    end
  end

end
