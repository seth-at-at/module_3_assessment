class BestBuyService

  def initialize
    @base_uri = Faraday.new("https://api.bestbuy.com/v1")
    @key = ENV["secret_api_key"]
  end

  def find_by_zip(zip)
    parse(@base_uri.get("stores(area(#{zip},25))?format=json&show=storeId,longName,city,phone,distance,storeType&pageSize=10&apiKey=#{@key}"))
  end

  def parse(input)
    JSON.parse(input.body)
  end
end
