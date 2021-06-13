require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
    @post = posts(:post_one)
    @user = users(:user_one)
  end

  test "should redirected if not logged in while creating comment" do
    post comments_url, params: { comment: { body: @comment.body, post_id: @comment.post_id, user_id: @comment.user_id } }
    assert_redirected_to new_user_session_path
  end

  test "should redirected if not logged in while deleting comment" do
    delete comment_url(@comment)
    assert_redirected_to new_user_session_path
  end

  test "should redirected if cant create comment" do
    sign_in users(:user_one)
    post comments_url, params: { comment: { body: nil, post_id: @comment.post_id } }
    assert_response :unprocessable_entity
  end

  test "should create comment" do
    sign_in users(:user_one)
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { body: @comment.body, post_id: @comment.post_id, user_id: @comment.user_id } }
    end
  end

  test "should destroy comment" do
    sign_in users(:user_one)
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment)
    end
  end
    test "should update comment" do
      sign_in users(:user_one)
      patch comment_url(@comment), params: { comment: { body: @comment.body, user_id: @comment.user.id, post_id: @comment.post.id } }
      assert_response :ok
    end
  
    test "should redirected if cant update comment" do
      sign_in users(:user_one)
      patch comment_url(@comment), params: { comment: { body: nil, user_id: @comment.user_id } }
      assert_response :unprocessable_entity
    end
end
