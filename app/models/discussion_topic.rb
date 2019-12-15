class DiscussionTopic < ApplicationRecord

  has_many :discussions

  validates :topic, presence: true
  validate :topic, :topic_starts_with_capital_letter

  def topic_starts_with_capital_letter
    if (self.topic) && (self.topic.chr != self.topic.chr.capitalize)
      errors.add(:topic, "Must start with a capital letter")
    end
  end

end
