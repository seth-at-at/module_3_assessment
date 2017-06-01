class SearchController < ApplicationController
  def index
    @service = BestBuyService.new
    @stores = @service.find_by_zip(params[:zip])
  end
end
