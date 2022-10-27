require 'rails_helper'
RSpec.describe PostsController, type: :request do
  describe 'Check post main page' do
    before(:example) do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end

    it 'Checks if the status response is succes(OK)' do
      expect(response.status).to be(200)
    end

    it 'Check the if the rendered template is correct' do
      expect(response.body).to include('<p>this is a list of all posts</p>')
    end
  end

  describe 'Check posts for specific user' do
    before(:example) do
      get '//users/1/posts/:id'
      expect(response).to render_template(:show)
    end

    it 'Check the posts page for a given user' do
      expect(response).to render_template(:show)
      expect(response.body).to include('<p>this is a specified post</p>')
      expect(response.status).to be(200)
    end
  end
end