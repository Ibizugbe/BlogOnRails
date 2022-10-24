require 'rails_helper'
require 'ffi'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.new(name: 'John', photo: 'https://www.google.com/url', bio: 'I am a software developer',
                     post_counter: 3)
    @user.save
  end

  subject do
    Post.new(title: 'Hello', text: 'Hello world', author_id: @user.id,
             like_counter: 6, comment_counter: 2)
  end

  before { subject.save }

  context 'Return valid post' do
    it 'should accept title' do
      expect(subject.title).to eq('Hello')
    end

    it 'should accept likes_counter' do
      expect(subject.like_counter).to eq(6)
    end

    it 'should accept CommentsCounter' do
      expect(subject.comment_counter).to eq(2)
    end

    context 'Return invalid post' do
      it 'should not accept blank title' do
        subject.title = nil
        expect(subject).to_not be_valid
      end

      it 'should not accept more than 250 character' do
        subject.title = 'a' * 251
        expect(subject).to_not be_valid
      end

      it 'should not accept blank negative likes counter' do
        subject.like_counter = -1
        expect(subject).to_not be_valid
      end

      it 'should not accept blank negative comments counter' do
        subject.comment_counter = -1
        expect(subject).to_not be_valid
      end
    end
  end
end
