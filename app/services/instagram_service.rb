class InstagramService
  attr_reader :connection

  def initialize(current_user)
    @connection = Faraday.new(url: 'https://api.instagram.com/v1/') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      faraday.params[:access_token] = current_user.token
    end
  end

  def pictures
    parse(connection.get("users/self/media/recent"))

  end

  private

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end


end
