class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_save :update_comment_counter

  def update_comment_counter
    post.increment!(:CommentsCounter)
  end
end