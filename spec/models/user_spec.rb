require 'rails_helper'
require 'ffi'

RSpec.describe User, type: :model do
  subject do
    User.new(Name: 'John', Photo: 'https://www.google.com/url', Bio: 'I am a software developer',
             PostCounter: 3)
  end

  before { subject.save }

  context 'Return valid user' do
    it 'should accept name' do
      expect(subject.Name).to eq('John')
    end

    it 'should accept photo' do
      expect(subject.Photo).to eq('https://www.google.com/url')
    end

    it 'should accept bio' do
      expect(subject.Bio).to eq('I am a software developer')
    end

    it 'should accept posts_counter' do
      expect(subject.PostCounter).to eq(3)
    end

    context 'Return invalid user' do
      it 'should not accept blank name' do
        subject.Name = nil
        expect(subject).to_not be_valid
      end

      it 'should not accept blank negative post counter' do
        subject.PostCounter = -1
        expect(subject).to_not be_valid
      end

      it 'should not accept blank non-integer post counter' do
        subject.PostCounter = 1.5
        expect(subject).to_not be_valid
      end
    end
  end
end