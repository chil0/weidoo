require "rails_helper"

RSpec.describe ChirpsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/chirps").to route_to("chirps#index")
    end

    it "routes to #new" do
      expect(:get => "/chirps/new").to route_to("chirps#new")
    end

    it "routes to #show" do
      expect(:get => "/chirps/1").to route_to("chirps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/chirps/1/edit").to route_to("chirps#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/chirps").to route_to("chirps#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/chirps/1").to route_to("chirps#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/chirps/1").to route_to("chirps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/chirps/1").to route_to("chirps#destroy", :id => "1")
    end
  end
end
