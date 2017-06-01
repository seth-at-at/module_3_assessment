class SearchController < ApplicationController
  def index
    @service = BestBuyService.new
    @response = @service.find_by_zip(params[:zip])
  end
end
