require 'rails_helper'

RSpec.describe "Destinations API" do
  it "sends a list of destinations" do
    create_list(:destination, 5)

    get '/api/v1/destinations'

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.class).to be(Array)
    expect(json.count).to be(5)
    expect(json[0]["created_at"]).to be_nil
    expect(json[0]["updated_at"]).to be_nil
  end

  it "sends one destination" do
    destinations = create_list(:destination, 3)

    get "/api/v1/destinations/#{destinations[1].id}"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.class).to eq(Hash)
  end

  it "creates a destination" do
    destination_params = {name: "Wheat Ridge", zip: "80202", description: "sucks"}

    post "/api/v1/destinations", params: {destination: destination_params}

    destination = Destination.last

    expect(response).to be_success
    expect(destination.name).to eq(destination_params[:name])
    expect(destination.zip).to eq(destination_params[:zip])
    expect(destination.description).to eq(destination_params[:description])
  end

  it "updates a destination" do
    old = Destination.last
    destination_params = {name: "New City"}

    put "/api/v1/destinations/#{old.id}"

    expect(response).to be_success
  end
end
