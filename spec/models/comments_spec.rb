require 'rails_helper'
require 'ffi'

RSpec.describe Comment, type: :model do
  user = User.create(Name: 'John', Photo: 'https://www.google.com/url', Bio: 'I am a software developer',
                     PostsCounter: 3)
  post = Post.create(Title: 'Hello', Text: 'Hello world', author_id: user.id, LikesCounter: 6, CommentsCounter: 3)

  comment = Comment.create(Text: 'Hello world', post_id: post.id)

  context 'Update comments counter' do
    comment.update_comments_counter

    it 'should increment comments counter' do
      expect(post.comments_counter).to eq(3)
    end
  end
end