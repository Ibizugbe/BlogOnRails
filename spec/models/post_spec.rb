require 'rails_helper'
require 'ffi'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.new(Name: 'John', Photo: 'https://www.google.com/url', Bio: 'I am a software developer',
                     PostCounter: 3)
    @user.save
  end

  subject do
    Post.new(Title: 'Hello', Text: 'Hello world', author_id: @user.id,
             LikesCounter: 6, CommentsCounter: 2)
  end

  before { subject.save }

  context 'Return valid post' do
    it 'should accept title' do
      expect(subject.Title).to eq('Hello')
    end

    it 'should accept likes_counter' do
      expect(subject.LikesCounter).to eq(6)
    end

    it 'should accept CommentsCounter' do
      expect(subject.CommentsCounter).to eq(2)
    end

    context 'Return invalid post' do
      it 'should not accept blank title' do
        subject.Title = nil
        expect(subject).to_not be_valid
      end

      it 'should not accept more than 250 character' do
        subject.Title = 'a' * 251
        expect(subject).to_not be_valid
      end

      it 'should not accept blank negative likes counter' do
        subject.LikesCounter = -1
        expect(subject).to_not be_valid
      end

      it 'should not accept blank negative comments counter' do
        subject.CommentsCounter = -1
        expect(subject).to_not be_valid
      end
    end
  end
end
