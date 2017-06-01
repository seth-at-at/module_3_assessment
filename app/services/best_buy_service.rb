class BestBuyService
  def initialize
    @con = HTTParty.new("https://api.bestbuy.com/v1/products((categoryPath.id=abcat0204000))?apiKey=#{ENV['secret_api_key']}")
  end
end
