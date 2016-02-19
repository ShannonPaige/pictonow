require "rails_helper"

describe "the signin process" do

  it "sign in user with Instagram Oauth" do
    visit '/'
    VCR.use_cassette("omniauth#login") do
      click_link 'Login with Instagram'
    end
    expect(page).to have_content 'ig_nickname'
    expect(page).to have_content 'ig_name ig_email ig_bio ig_website'
    expect(page).to have_content '264 posts 257 followers 132 following'
    expect(page).to have_content 'Logout'
    expect(page).to have_css "img[src*='12750367_830093693789464_515302271_n.jpg']"
  end

  it "signs out user" do
    visit '/'
    VCR.use_cassette("omniauth#login") do
      click_link 'Login with Instagram'
    end
    click_link 'Logout'
    expect(page).to have_content "Welcome to PictoNOW We're in the Sandbox!"
    expect(page).to have_content 'Login with Instagram'
  end
end
