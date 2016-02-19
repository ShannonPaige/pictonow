require 'rails_helper'


describe "User model" do
  let(:auth_info) do
    OmniAuth::AuthHash.new({
      provider: 'instagram',
      uid: 'ig_uid',
      info: {
        nickname: "ig_nickname",
        name:     "ig_name",
        email:    "ig_email",
        image:    "ig_image",
        bio:      "ig_bio",
        website:  "ig_website",
      },
      credentials: {
        token: ENV["token"],
      }
    })
  end

  it "can create or find a user from auth_info" do
    User.find_or_create_from_omniauth(auth_info)
    user = User.last

    assert_equal 'ig_uid',      user.uid
    assert_equal 'ig_nickname', user.nickname
    assert_equal 'ig_name',     user.name
    assert_equal 'ig_email',    user.email
    assert_equal 'ig_image',    user.image
    assert_equal 'ig_bio',      user.bio
    assert_equal 'ig_website',  user.website
  end

end
