require 'test_helper'

class BlogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user_one)
    @blog = blogs(:blog_one)
    @blog2 = blogs(:blog_two)
    
  end

  test "should get blog from root_url" do
    sign_in users(:user_one)
    get root_url(subdomain: @blog.subdomain), params: { blog: { name: @blog.name, user: @user, background_color: @blog.background_color, header_color: @blog.header_color, text_color: @blog.text_color, font_family: @blog.font_family }}
    assert_response :ok
  end

end
