require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @after_bar_title = "Discussion"
  end

  test "GET home" do
    get root_path
    #was request sucessful
    assert_response :success
    #was correct layout used
    assert_template layout: 'application'
    #was the correct title retrieved
    assert_select "title", "Home | #{@after_bar_title}"
    #was the correct h1 title retrieved
    assert_select "h1", "What is on your mind?"
  end

  test "GET contact" do
    get contact_path
    #was request sucessful
    assert_response :success
    #was correct layout used
    assert_template layout: 'application'
    #was the correct title retrieved
    assert_select "title", "Contact | #{@after_bar_title}"
    #is the form there
    assert_select 'form' do
      assert_select 'input[type=text]'
      assert_select 'input[type=email]'
      assert_select 'textarea'
      assert_select 'input[type=submit]'
    end
  end

  #testing that a message can be sent
  test "POST create" do
    assert_difference 'ActionMailer::Base.deliveries.size', 1 do
      post create_message_url, params: {
        message:{
          name: 'John',
          email: 'john@gmail.com',
          message: 'Test message'
        }
      }
    end

    assert_redirected_to contact_path
    follow_redirect!

    assert_match /Your message has been successfully sent!/, response.body
  end

  #testing that invalid response returns errors
  test "invalid POST create" do
    post create_message_url, params: {
      message: { name: '', email: '', message: '' }
    }

    assert_match /Name .* blank/, response.body
    assert_match /Email .* blank/, response.body
    assert_match /Message .* blank/, response.body
  end

end
