require 'rails_helper'

describe 'InstagramService' do

  let(:service) do
    user = User.new(token: ENV["token"])
    InstagramService.new(user)
  end

  describe "#user profile" do
    it "returns the user profile" do
      VCR.use_cassette("instagram_service#user_profile") do
        user_info = service.user_info

        expect(user_info[:data][:username]).to eq("diagonalizable")
        expect(user_info[:data][:full_name]).to eq("Shannon P")
        expect(user_info[:data][:id]).to eq("25151534")
      end
    end
  end

  describe "#user pictures" do
    it "returns the user's most recent pictures" do
      VCR.use_cassette("instagram_service#user_pictures") do
        pics = service.pictures
        pic = pics[:data].first

        expect(pic[:type]).to eq("image")
        expect(pic[:images][:low_resolution][:url]).to eq("https://scontent.cdninstagram.com/t51.2885-15/s320x320/e35/12750367_830093693789464_515302271_n.jpg?ig_cache_key=MTE4NDkzNjAwODg2NzExODYyMg%3D%3D.2")
        expect(pic[:caption][:text]).to eq("Just helped a friend move and secured my summer plans 🏊")
      end
    end
  end

end
