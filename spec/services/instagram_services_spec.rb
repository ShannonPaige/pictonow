require 'rails_helper'

describe 'InstagramService' do

  let(:service) do
    user = User.new(token: ENV["token"])
    InstagramService.new(user)
  end

  let(:media_id) {'1184936008867118622_25151534'}

  describe "#user_info" do
    it "returns the user profile" do
      VCR.use_cassette("instagram_service#user_info") do
        user_info = service.user_info

        expect(user_info[:data][:username]).to eq("diagonalizable")
        expect(user_info[:data][:full_name]).to eq("Shannon P")
        expect(user_info[:data][:id]).to eq("25151534")
      end
    end
  end

  describe "#pictures" do
    it "returns the user's most recent pictures" do
      VCR.use_cassette("instagram_service#pictures") do
        pics = service.pictures
        pic = pics[:data].first

        expect(pic[:type]).to eq("image")
        expect(pic[:images][:low_resolution][:url]).to eq("https://scontent.cdninstagram.com/t51.2885-15/s320x320/e35/12750367_830093693789464_515302271_n.jpg?ig_cache_key=MTE4NDkzNjAwODg2NzExODYyMg%3D%3D.2")
        expect(pic[:caption][:text]).to eq("Just helped a friend move and secured my summer plans 🏊")
      end
    end
  end

  describe "#find_pic" do
    it "returns a picture details" do
      VCR.use_cassette("instagram_service#find_pic") do
        picture = service.find_pic(media_id)

        expect(picture[:data][:type]).to eq("image")
        expect(picture[:data][:likes][:count]).to eq(13)
        expect(picture[:data][:images][:low_resolution][:url]).to eq("https://scontent.cdninstagram.com/t51.2885-15/s320x320/e35/12750367_830093693789464_515302271_n.jpg?ig_cache_key=MTE4NDkzNjAwODg2NzExODYyMg%3D%3D.2")
      end
    end
  end

  describe "#comments" do
    it "returns a picture details" do
      VCR.use_cassette("instagram_service#comments") do
        comments = service.comments(media_id)
        comment = comments[:data].first

        expect(comment[:text]).to eq("I am commenting!!!!!")
        expect(comment[:from][:username]).to eq("justinpease1")
      end
    end
  end

  describe "#likes" do
    it "returns a picture details" do
      VCR.use_cassette("instagram_service#likes") do
        likes = service.likes(media_id)
        like = likes[:data].first

        expect(like[:username]).to eq("edgarduran303")
      end
    end
  end

end
