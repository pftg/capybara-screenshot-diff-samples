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

    it "check empty new post form" do
      visit '/posts'

      click_on 'New post'

      screenshot "new_post", skip_area: "form"
    end

    it "not raise error with changes in the skip_area" do
      visit '/posts'

      click_on 'New post'
      fill_in 'Title', with: 'New Post'
      fill_in 'Body', with: 'About life'

      screenshot "new_post", skip_area: "form"
    end

    it "supports crop by element" do
      visit '/posts'

      click_on 'New post'
      fill_in 'Title', with: 'New Post'
      fill_in 'Body', with: 'About life'

      screenshot "posts-cropped_form-vips", crop: 'form', driver: :vips
    end
  end
end
