require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @after_bar_title = "Discussion"
  end

  test "should get home" do
    get static_pages_home_url
    #was request sucessful
    assert_response :success
    #was correct layout used
    assert_template layout: 'application'
    #was the correct title retrieved
    assert_select "title", "Home | #{@after_bar_title}"
  end

  test "should get contact" do
    get static_pages_contact_url
    #was request sucessful
    assert_response :success
    #was correct layout used
    assert_template layout: 'application'
    #was the correct title retrieved
    assert_select "title", "Contact | #{@after_bar_title}"
  end

end
