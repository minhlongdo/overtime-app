require 'rspec'

describe 'navigate', type: :feature do
  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to equal(200)
    end

    it 'has a title of Posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end
end
