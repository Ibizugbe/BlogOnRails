require 'rails_helper'
require 'ffi'

RSpec.describe Like, type: :model do
  user = User.create(Name: 'John', Photo: 'https://www.google.com/url', Bio: 'I am a software developer',
                     PostCounter: 3)
  post = Post.create(Title: 'Hello', Text: 'Hello world', author_id: user.id, LikesCounter: 6, CommentsCounter: 3)

  like = Like.create(author_id: user.id, post_id: post.id)

  context 'Update likes counter' do
    like.update_like_counter

    it 'should increment likes counter' do
      expect(post.LikesCounter).to eq(6)
    end
  end
end
