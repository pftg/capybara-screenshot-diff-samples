require 'rails_helper'

RSpec.describe "Posts", type: :system do
  include Capybara::Screenshot::Diff

  before { driven_by(:cuprite) }

  describe 'visual regressions' do
    it "should not raise error without changes" do
      visit '/posts'
      screenshot "posts"
    end

    it "should raise error with changes" do
      visit '/posts'
      click_on 'New post'
      fill_in 'Title', with: 'New Post'
      fill_in 'Body', with: 'About life'

      screenshot "posts"
    end
  end
end
