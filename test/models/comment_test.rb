require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = comments(:validComment)
  end

  test 'valid comment' do
    assert @comment.valid?
  end

  test 'invalid without a Comment' do
    @comment.comment = nil
    refute @comment.valid?, 'saved comment without a comment'
    assert_not_nil @comment.errors[:comment], 'no validation error for title present'
  end

end
