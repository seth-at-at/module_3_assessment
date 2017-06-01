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
    @base_uri = Faraday.new("https://api.bestbuy.com/v1/stores")
    @key = ENV["secret_api_key"]
  end

  def find_by_zip(zip)
    x = @base_uri.get("(postalCode=#{zip})?apiKey=#{@key}&format=json")
    binding.pry
  end

  def parse(input)
    JSON.parse(input.body)
  end
end
