require 'rails_helper'

describe "Items API" do
  # context "it can see items"
    it "sends a list of items" do
      create_list(:item, 3)

      get '/api/v1/items'

      expect(response).to be_success

      raw_items = JSON.parse(response.body)
      raw_item = raw_items.first

      expect(raw_items.count).to eq 3
      expect(raw_item).to have_key("name")
      expect(raw_item["name"]).to be_a String
      expect(raw_item).to have_key("description")
      expect(raw_item["description"]).to be_a String
    end

    it "sends an item" do
      item = create(:item)

      get "/api/v1/items/#{item.id}"

      expect(response).to be_success

      raw_item = JSON.parse(response.body)

      expect(raw_item["id"]).to eq(item.id)
      expect(raw_item).to have_key("name")
      expect(raw_item["name"]).to be_a String
      expect(raw_item).to have_key("description")
      expect(raw_item["description"]).to be_a String
    end
  # end

  # context "POST api/vi/items" do
    it "creates an item" do
      item_params = {
        name: "Super Mario Bros. 3",
        description: "the best video game"
      }

      expect {
        post "/api/v1/items", params: item_params
      }.to change { Item.count }.by(1)

      expect(response).to have_http_status(200)
    end
  # end
end
