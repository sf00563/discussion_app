require 'test_helper'

class DiscussionTopicTest < ActiveSupport::TestCase

  def setup
    @discussiontopic = discussion_topics(:validDiscussionTopic)
  end

  test 'valid discussion topic' do
    assert @discussiontopic.valid?
  end

  test 'invalid without topic' do
    @discussiontopic.topic = nil
    refute @discussiontopic.valid?, 'discussion topic valid without a topic'
    assert_not_nil @discussiontopic.errors[:topic], 'no validation error for topic present'
  end

  test 'invalid when topic name does not start with capital' do
    @discussiontopic.topic = 'music'
    refute @discussiontopic.valid?, 'discussion topic valid when starts lowercase'
    assert_not_nil @discussiontopic.errors[:topic], 'no validation error for topic present'
  end

  test 'association to discussion' do
    assert_equal 3, @discussiontopic.discussions.size
  end

end
