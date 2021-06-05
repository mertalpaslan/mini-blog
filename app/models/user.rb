class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
         
  has_many :posts
  has_many :comments
end
