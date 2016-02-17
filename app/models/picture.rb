class Picture

  def self.all(service)
    recent_pics = service.pictures
    pics = recent_pics[:data].map { |picture| build_object(picture) }
  end

  private

    def self.build_object(data)
      OpenStruct.new(data)
    end

end
