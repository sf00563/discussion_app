require 'test_helper'

class DiscussiontopicsControllerTest < ActionDispatch::IntegrationTest

  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
    @after_bar_title = "Discussion"
  end

  test "should get index" do
    get discussiontopics_path
    assert_response :success
    assert_select "title", "Discussion Topic | #{@after_bar_title}"
    assert_select "h1", "Discussion topics"
  end

  test "should get show" do
    #can pass in one because the discussion topics are provided by default not user added
    get discussiontopics_discussions_path(1)
    assert_response :success
    assert_select "title", "Discussions | #{@after_bar_title}"
    assert_select 'table' do
      assert_select 'td',"Title"
      assert_select 'td',"Brief description"
      assert_select 'td',"Date created"
      assert_select 'td',"Created by"
      assert_select 'td',"Options"
    end
  end

end
