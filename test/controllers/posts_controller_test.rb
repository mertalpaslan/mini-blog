require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:post_one)
    @user = users(:user_one)
    @blog = blogs(:blog_one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should redirected if not logged in while creating post" do
    post posts_url, params: { post: { body: @post.body, title: @post.title, user_id: @post.user_id } }
    assert_redirected_to new_user_session_path
  end

  test "should redirected if not logged in while deleting post" do
    delete post_url(@post)
    assert_redirected_to new_user_session_path
  end

  test "should redirected if not logged in while updating post" do
    patch post_url(@post), params: { post: { body: @post.body, title: @post.title, user_id: @post.user_id } }
    assert_redirected_to new_user_session_path
  end

  test "should create post" do
    sign_in users(:user_one)
    assert_difference('Post.count') do
      post posts_url, params: { post: { body: @post.body, title: @post.title, user_id: @post.user_id } }
    end
    assert_redirected_to posts_url
  end

  test "should redirected if cant create post" do
    sign_in users(:user_one)
    post posts_url, params: { post: { title: @post.title, user_id: @post.user_id } }
    assert_redirected_to posts_url
  end

  test "should destroy post" do
    sign_in users(:user_one)
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
  
  test "should update post" do
    sign_in users(:user_one)
    patch post_url(@post), params: { post: { body: @post.body, title: @post.title, user_id: @post.user_id } }
    assert_redirected_to posts_url
  end

  test "should redirected if cant update post" do
    sign_in users(:user_one)
    patch post_url(@post), params: { post: { body: nil, title: @post.title, user_id: @post.user_id } }
    assert_redirected_to posts_url
  end

end
