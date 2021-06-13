require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  setup do
    @user = users(:user_one)
  end

  test 'valid blog' do
    blog = Blog.new(name: "My String", background_color: "My String", header_color: "My String", text_color: "My String", font_family: "My String", user: @user)
    assert blog.valid?
  end

  test 'invalid blog name shorter than three charachters' do
    blog = Blog.new(name: "ab", background_color: "My String", header_color: "My String", text_color: "My String", font_family: "My String", user: @user)
    assert_not_nil blog.errors[:name]
    refute blog.valid?
  end

  test 'invalid blog without name' do
    blog = Blog.new(name: nil, background_color: "My String", header_color: "My String", text_color: "My String", font_family: "My String", user: @user)
    assert_not_nil blog.errors[:name]
    refute blog.valid?
  end

  test 'invalid blog without user' do
    blog = Blog.new(name: "My String", background_color: "My String", header_color: "My String", text_color: "My String", font_family: "My String")
    assert_not_nil blog.errors[:user_id]
    refute blog.valid?
  end
end