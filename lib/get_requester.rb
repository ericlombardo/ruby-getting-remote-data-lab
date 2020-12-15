class GetRequester
  require 'pry'      
  require 'open-uri'  # makes url link a URI object => can use .open #=> StringIO
  require 'net/http'  # makes requests to endpoints #=> NET::HTTPOK object
  require 'json'      # takes NET::HTTPOK object and formats for easier manipulatioin
  attr_accessor :url

  def initialize(url)
    @url = url    # assign url to variable
  end

  def get_response_body
    uri = URI.parse(@url)   # make uri object
    response = Net::HTTP.get_response(uri)    # send request with NET::HTML
    response.body   #=> body from Net::HTTPOK object returned 
  end

  def parse_json    #=> formatted body returned by #get_response_body method
    JSON.parse(get_response_body)
  end


end