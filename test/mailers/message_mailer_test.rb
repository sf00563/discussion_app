require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase

  test "contact_me" do
    message = Message.new name: 'John',
                          email: 'john@gmail.com',
                          message: 'hello, did you get this?'

    email = MessageMailer.contact_me(message)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal 'Message from Discussion', email.subject
    assert_equal ['samfoster90@gmail.com'], email.to
    assert_equal ['john@gmail.com'], email.from
    assert_match /hello, did you get this?/, email.message.encoded
  end

end
