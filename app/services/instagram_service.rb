class InstagramService
  attr_reader :connection

  def initialize(current_user)
    @connection = Faraday.new(url: 'https://api.instagram.com/v1/') do |faraday|
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      faraday.params[:access_token] = current_user.token
    end
  end

  def pictures
    parse(connection.get("users/self/media/recent"))
  end

  def find_pic(media_id)
    parse(connection.get("media/#{media_id}"))
  end

  def comments(media_id)
    parse(connection.get("media/#{media_id}/comments"))
  end

  def likes(media_id)
    parse(connection.get("media/#{media_id}/likes"))
  end

  def user_info
    parse(connection.get("users/self"))
  end

  private

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end


end
