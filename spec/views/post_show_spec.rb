RSpec.describe 'Renders the post show page', type: :feature do
  before :each do
    @user = User.create(name: 'John Carson', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'I am an auditor with 30 years working experience.', post_counter: 0)
    @first_post = Post.create(title: 'Hello', text: 'This is my first post', comment_counter: 0, like_counter: 0,
                              author_id: @user.id)
    @second_post = Post.create(title: 'welcome', text: 'This is my second post', comment_counter: 0, like_counter: 0,
                                author_id: @user.id)
    5.times do |_i|
      Comment.create(text: 'Nice post!!', author_id: @user.id, post_id: @first_post.id)
    end
    visit user_post_path(@first_post.author, @first_post)
  end

  scenario 'displays the post title' do
    expect(page).to have_content(@first_post.title)
  end

  scenario 'shows the person who wrote the post' do
    expect(page).to have_content('John Carson')
  end

  it 'can see the username of each commentor.' do
    post = Post.first
    comment = post.comments.first
    expect(page).to have_content("John Carson")
  end

  scenario 'disolays number of comments' do
    expect(page).to have_content('Comments: 5')
  end

  scenario 'displays number of likes' do
    expect(page).to have_content('Likes: 0')
  end

  scenario 'displays the content of the post' do
    expect(page).to have_content(@first_post.text)
  end


end
