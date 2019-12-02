require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  test 'responds to full name, email and message' do
    msg = Message.new
    assert msg.respond_to?(:name), 'does not respond to :name'
    assert msg.respond_to?(:email), 'does not respond to :email'
    assert msg.respond_to?(:message), 'does not respond to :message'
  end

  test 'valid when attributes set' do
    attributes = {
      name: 'James',
      email: 'jamespickle@gmail.com',
      message: 'Hello there!'
    }

    msg = Message.new attributes
    assert msg.valid?, 'should be valid'
  end

  test 'name, email and body are required' do
    msg = Message.new

    refute msg.valid?, 'Blank Mesage are invalid'

    assert_match /blank/, msg.errors[:name].to_s
    assert_match /blank/, msg.errors[:email].to_s
    assert_match /blank/, msg.errors[:message].to_s
  end

end
