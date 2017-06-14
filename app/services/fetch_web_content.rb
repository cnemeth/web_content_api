class FetchWebContent
  Result = ImmutableStruct.new(:status_code, :status_message, :headers, :body, :total_time)

  attr_reader :url

  def initialize(**args)
    params = defaults.merge!(args)
    @url = params[:url]
  end

  def call
    return nil if url.empty?

    request = Typhoeus::Request.new(url)
    request.run
    response = request.response

    code = response.code
    message = response.status_message
    body = Nokogiri::HTML(response.response_body)
    headers = response.headers
    time = response.total_time

    Result.new(status_code: code,
               status_message: message,
               headers: headers,
               body: body,
               total_time: time)
  end

  private

  def defaults
    {
      url: ''
    }
  end
end
