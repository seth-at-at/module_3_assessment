require "rails_helper"

RSpec.describe "When sending requests", type: :request do
  context "GET" do
    before(:each) do
      create_list(:item, 10)
    end

    it "returns JSON containing all items" do
      get "/api/v1/items"
      items = JSON.parse(response.body)
      first_item = items.first
      expect(items.count).to eq(10)
      expect(first_item["name"]).to eq(Item.first.name)
      expect(first_item["description"]).to eq(Item.first.description)
      expect(first_item["image_url"]).to eq(Item.first.image_url)
      expect(first_item["created_at"]).to eq(nil)
      expect(first_item["updated_at"]).to eq(nil)
    end

    it "returns JSON containing specific item" do
      get "/api/v1/items/1"
      item = JSON.parse(response.body)
      expect(item["name"]).to eq(Item.first.name)
      expect(item["description"]).to eq(Item.first.description)
      expect(item["image_url"]).to eq(Item.first.image_url)
      expect(item["created_at"]).to eq(nil)
      expect(item["updated_at"]).to eq(nil)
    end
  end

  context "DELETE" do
    it "returns 204 JSON that item is deleted" do
      delete "/api/v1/items/1"
      expect(response.status).to eq 204
    end
  end

  context "POST" do
    it "returns 201 JSON that item is created with attributes" do
      post "/api/v1/items", params:{name: "My item", description: "I made this", image_url: "http://i2.kym-cdn.com/entries/icons/original/000/019/784/iconimadethis.png"}
      expect(response.status).to eq 201
      item = JSON.parse(response.body)
      expect(item["item"]["name"]).to eq "My item"
      expect(item["item"]["description"]).to eq "I made this"
      expect(item["item"]["image_url"]).to eq "http://i2.kym-cdn.com/entries/icons/original/000/019/784/iconimadethis.png"
    end
  end
end
