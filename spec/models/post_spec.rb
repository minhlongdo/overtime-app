require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do
      @post = Post.create(date: Date.today, rationale: "Anything")
      @post.user = User.create(email: "test@test.com",
                               password: "1234567",
                               password_confirmation: "1234567",
                               first_name: "Jon",
                               last_name: "Snow")
    end

    it 'can be created' do
      expect(@post).to be_valid
    end

    it 'cannot be created without a date and rationale' do
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end
  end
end
