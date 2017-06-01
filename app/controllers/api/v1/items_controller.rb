class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    Item.delete(params[:id])
    head :no_content
  end

  def create
    item = Item.create(name: params["params"]["name"],
                       description: params["params"]["description"],
                       image_url: params["params"]["image_url"])
       render status: 201, json: {
        item: item,
        message: "Successfully created item: #{item.name}"
      }
  end

  private
    def item_params
      params.permit(:id,
                    :name,
                    :description,
                    :image_url)
    end
end
