require "rails_helper"

RSpec.describe "the signin process" do

  before do
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:instagram]
  end

  it "signs in user with Instagram Oauth" do
    visit '/'
    click_link 'Login with Instagram'
    expect(page).to have_content 'Welcome ig_nickname'
    expect(page).to have_content 'ig_name ig_email ig_bio ig_website'
    expect(page).to have_content 'View Your Photos View Your Friends View the Dogs of Instagram'
    expect(page).to have_content 'Logout'
  end
end
