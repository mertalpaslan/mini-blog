class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
         
  has_many :posts
  has_many :comments
  has_one :blog

  after_create :create_blog

  def full_name
    "#{first_name} #{last_name}"
  end

  def create_blog
    blog = Blog.new(name: "blog_#{self.id}", user: self )
    blog.save
  end
end