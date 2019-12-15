require 'test_helper'

class DiscussionTest < ActiveSupport::TestCase

  def setup
    @discussion = discussions(:validDiscussion)
  end

  test 'valid discussion' do
    assert @discussion.valid?
  end

  test 'invalid without a title' do
    @discussion.title = nil
    refute @discussion.valid?, 'saved discussion without a title'
    assert_not_nil @discussion.errors[:title], 'no validation error for title present'
  end

  test 'invalid without a body' do
    @discussion.content = nil
    refute @discussion.valid?, 'saved discussion without a title'
    assert_not_nil @discussion.errors[:content], 'no validation error for title present'
  end

  test 'association to comments' do
    assert_equal 2, @discussion.comments.size
  end

  test 'scope that was placed on comments' do
    assert_includes @discussion.comments, comments(:one)
    refute_includes @discussion.comments, comments(:old)
  end
  
end
