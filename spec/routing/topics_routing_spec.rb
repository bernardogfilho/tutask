require "spec_helper"

describe TopicsController do
  describe "routing" do

    it "routes to #index" do
      get("projects/1/topics").should route_to("topics#index", project_id: "1")
    end

    it "routes to #new" do
      get("projects/1/topics/new").should route_to("topics#new", project_id: "1")
    end

    it "routes to #show" do
      get("projects/1/topics/1").should route_to("topics#show", :id => "1", project_id: "1")
    end

    it "routes to #edit" do
      get("projects/1/topics/1/edit").should route_to("topics#edit", :id => "1", project_id: "1")
    end

    it "routes to #create" do
      post("projects/1/topics").should route_to("topics#create", project_id: "1")
    end

    it "routes to #update" do
      put("projects/1/topics/1").should route_to("topics#update", :id => "1", project_id: "1")
    end

    it "routes to #destroy" do
      delete("projects/1/topics/1").should route_to("topics#destroy", :id => "1", project_id: "1")
    end

  end
end
