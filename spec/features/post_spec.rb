require 'rspec'

describe 'navigate', type: :feature do
  before do
    @user = User.create(email: "test@test.com",
                       password: "1234567",
                       password_confirmation: "1234567",
                       first_name: "Jon",
                       last_name: "Snow")
    @user.save
    login_as(@user, :scope => :user)
    visit posts_path
  end

  describe 'index' do
    it 'can be reached successfully' do
      expect(page.status_code).to equal(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      post1 = Post.create(date: Date.today, rationale: "Post1")
      post1.user = @user
      post1.save
      post2 = Post.create(date: Date.today, rationale: "Post2")
      post2.user = @user
      post2.save
      visit posts_path
      expect(page).to have_content(/Post1|Post2/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to equal(200)
    end

    it 'can be created from new form page' do

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"

      click_on "Save"

      expect(page).to have_content("Some rationale")
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end
end
