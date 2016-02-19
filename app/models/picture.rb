class Picture
  def self.all(service)
    pics = service.pictures
    pics[:data].map { |picture| build_object(picture) }
  end

  def self.find(service, media_id)
    pic = service.find_pic(media_id)
    build_object(pic[:data])
  end

  def self.pic_comments(service, media_id)
    comments = service.comments(media_id)
    comments[:data].map { |comment| build_object(comment)}
  end

  def self.pic_likes(service, media_id)
    likes = service.likes(media_id)
    likes[:data].map { |like| build_object(like) }
  end

  private

    def self.build_object(data)
      OpenStruct.new(data)
    end

end
