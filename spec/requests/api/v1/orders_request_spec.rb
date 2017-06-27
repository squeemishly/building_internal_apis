require 'rails_helper'

RSpec.describe "an order" do
  it "can list all orders" do
    create_list(:order, 3)

    get '/api/v1/orders'

    orders = JSON.parse(response.body)
    order = orders.first

    expect(response).to be_success
    expect(orders.count).to eq 3
    expect(order).to have_key "order_number"
  end

  it "can see a single order" do
    id = create(:order).id

    get "/api/v1/orders/#{id}"

    order = JSON.parse(response.body)

    expect(response).to be_success
    expect(order).to have_key "order_number"
  end
end
