require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @user = users(:user_one)
  end

  test 'valid post' do
    post = Post.new(title: 'MyString', body: 'MyString', user_id: @user.id)
    assert post.valid?
  end

  test 'invalid post without title' do
    post = Post.new(body: 'MyString', user_id: @user.id)
    assert_not_nil post.errors[:title]
    refute post.valid?
  end

  test 'invalid post without body' do
    post = Post.new(title: 'MyString', user_id: @user.id)
    assert_not_nil post.errors[:body]
    refute post.valid?
  end

  test 'invalid post without user' do
    post = Post.new(title: 'MyString', body: 'MyString')
    refute post.valid?
    assert_not_nil post.errors[:user]
  end
end
