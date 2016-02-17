require "rails_helper"

Rails.describe "the signin process", :type => :feature do

  before do
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:instagram]
  end

  it "signs me in" do
    visit '/'
    click_link 'Login with Instagram'
    expect(page).to have_content 'You Are Authorized ig_name ig_nickname ig_email ig_bio ig_website Logout'
  end
end
