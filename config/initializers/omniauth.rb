Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instagram, ENV["instagram_id"], ENV["instagram_secret"],
  {:scope => "basic likes comments follower_list public_content"}
end
