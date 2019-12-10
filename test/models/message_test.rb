require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  #message should respond to :name, :email, :body
  test 'message has name, email and body' do
    msg = Message.new
    assert msg.respond_to?(:name), 'does not respond to :name'
    assert msg.respond_to?(:email), 'does not respond to :email'
    assert msg.respond_to?(:message), 'does not respond to :message'
  end

  #testing that the attributes can be set
  test 'valid when attributes set' do
    attributes = {
      name: 'James',
      email: 'jamespickle@gmail.com',
      message: 'Hello there!'
    }

    msg = Message.new attributes
    assert msg.valid?, 'the attributes were not valid'
  end

  #testing that a message must have a name, email and body
  test 'name, email and body are required' do
    msg = Message.new

    refute msg.valid?, 'Blank Messages are appearing valid'

    assert_match /blank/, msg.errors[:name].to_s
    assert_match /blank/, msg.errors[:email].to_s
    assert_match /blank/, msg.errors[:message].to_s
  end

end
