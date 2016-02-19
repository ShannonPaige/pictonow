require "rails_helper"

describe "user can view a picture" do

  it "click a picture and see it's show page" do
    visit '/'
    VCR.use_cassette("omniauth#login") do
      click_link 'Login with Instagram'
    end

    expect(page).to have_css "img[src*='12750367_830093693789464_515302271_n.jpg']"

    VCR.use_cassette("instagram#view_image") do
      visit "users/pictures/1184936008867118622_25151534"
    end

    expect(page).to have_content 'ig_nickname'
    expect(page).to have_content 'See All Pics'
    expect(page).to have_content 'Logout'
    expect(page).to have_content 'Just helped a friend move and secured my summer plans'
    expect(page).to have_content '13 users'
    expect(page).to have_content 'edgarduran303'
    expect(page).to have_content 'artofmoxie'
    expect(page).to have_content 'justinpease1 I am commenting!!!!!'
    expect(page).to have_css "img[src*='12750367_830093693789464_515302271_n.jpg']"
  end
end
