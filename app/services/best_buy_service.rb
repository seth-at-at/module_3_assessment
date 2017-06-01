# class BestBuyService
#   def initialize
#     @con = HTTParty.get("https://api.bestbuy.com/v1/products((categoryPath.id=abcat0204000))?apiKey=#{ENV['secret_api_key']}")
#   end
#
#   def find_by_zip(zip)
#     @con.get"stores(postalCode=55423)&format=json"
#   end
# end

class BestBuyService

  def initialize
    @base_uri = Faraday.new("https://api.bestbuy.com/v1")
    @key = ENV["secret_api_key"]
  end

  def find_by_zip(zip)
    parse(@base_uri.get("stores(area(#{zip},25))?format=json&show=storeId,name,city,phone,distance,storeType&pageSize=10&apiKey=#{@key}"))
  end

  def parse(input)
    JSON.parse(input.body, symbolize_name: true)
  end
end
