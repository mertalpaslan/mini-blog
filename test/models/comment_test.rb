require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @post = posts(:post_one)
    @user = users(:user_one)
  end

  test 'valid comment' do
    comment = Comment.new(body: 'MyString', user: @user, post: @post)
    assert comment.valid?
  end

  test 'invalid comment without body' do
    comment = Comment.new(user_id: @user.id, post: @post)
    assert_not_nil comment.errors[:body]
    refute comment.valid?
  end

  test 'invalid comment without user' do
    comment = Comment.new(body: 'MyString', post: @post)
    assert_not_nil comment.errors[:user]
    refute comment.valid?
  end

  test 'invalid comment without post' do
    comment = Comment.new(body: 'MyString', user: @user)
    refute comment.valid?
    assert_not_nil comment.errors[:post]
  end
end
