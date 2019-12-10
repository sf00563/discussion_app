class DiscussionTopic < ApplicationRecord
  validates :topic, presence: true
  validate :topic, :topic_starts_with_capital_letter

  def topic_starts_with_capital_letter
    if self.topic[0] != self.topic[0].capitalize
      errors.add(:topic, "Must start with a capital letter")
    end
  end
end
