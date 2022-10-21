class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def return_recent_posts
    Post.limit(3).order(created_at: :desc)
  end
end
