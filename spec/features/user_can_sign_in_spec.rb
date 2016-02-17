require "rails_helper"

Rails.describe "the signin process", type: :feature do
  include Capybara::DSL

  before do
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:instagram]
  end

  it "signs me in" do
    visit '/'
    click_link 'Login with Instagram'
    expect(page).to have_content 'Success'
  end
end
