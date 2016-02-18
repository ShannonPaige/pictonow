class User < ActiveRecord::Base

  def self.find_or_create_from_omniauth(auth_info)
    user = User.find_or_create_by(provider: auth_info["provider"], uid: auth_info['uid'])

    user.nickname       = auth_info['info']['nickname']
    user.name           = auth_info['info']['name']
    user.email          = auth_info['info']['email']
    user.image          = auth_info['info']['image']
    user.bio            = auth_info['info']['bio']
    user.website        = auth_info['info']['website']
    user.token          = auth_info['credentials']['token']

    user.save
    user
  end

  def self.profile(service)
    profile_info = service.user_info
    build_object(profile_info[:data])
  end

  private

    def self.build_object(data)
      OpenStruct.new(data)
    end
end
