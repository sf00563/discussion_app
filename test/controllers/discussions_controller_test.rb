require 'test_helper'

class DiscussionsControllerTest < ActionDispatch::IntegrationTest

  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
    @after_bar_title = "Discussion"
    @discussion = discussions(:validDiscussion)
  end

  test "the action show success" do
    get discussion_path(@discussion)
    assert_response :success
    assert_select "title", "Current Discussion | #{@after_bar_title}"
    assert_select "h2", "Comments"
  end

  test "the edit action success" do
    get edit_discussion_path(@discussion)
    assert_response :success
    assert_select "h1", "Edit discussion"
    assert_select 'form' do
      assert_select 'input[type=text]'
      assert_select 'textarea'
      assert_select 'input[type=submit]'
    end
  end

  test "the update action success" do
    patch discussion_path(@discussion), params: { discussion: { title: 'Rails is awesome!', content: 'Hello Rails' } }
    assert_response :redirect
  end

  test "the update action failure" do
    patch discussion_path(@discussion), params: { discussion: { title: nil, content: nil } }
    assert_response :redirect
    assert_not_empty flash[:errors]
  end

  test "the new action success" do
    discussiontopic = discussion_topics(:validDiscussionTopic)
    get new_discussion_path(discussiontopic)
    assert_response :success
    assert_select "h1", "New discussion"
    assert_select 'form' do
      assert_select 'input[type=text]'
      assert_select 'textarea'
      assert_select 'input[type=hidden]'
      assert_select 'input[type=hidden]'
      assert_select 'input[type=submit]'
    end
  end

  test "the create action sucess" do
    post discussions_path(@discussion), params: { discussion: { title: 'Rails is awesome!', content: 'Hello Rails', user_id: '1', discussion_topic_id: '1' } }
    assert_response :redirect
  end

  test "the create action failure" do
    post discussions_path(@discussion), params: { discussion: { title: nil, content: nil, user_id: nil, discussion_topic_id: nil } }
    assert_response :redirect
    assert_not_empty flash[:errors]
  end

  test "the destroy action success" do
    delete discussion_path(@discussion)
    assert_response :redirect
  end

end
