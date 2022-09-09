require 'rails_helper'

RSpec.describe "Posts", type: :system do
  include Capybara::Screenshot::Diff

  before { driven_by(:cuprite) }

  describe 'visual regressions' do
    it "should not raise error without changes" do
      visit '/posts'
      screenshot "posts"
    end
  end
end
