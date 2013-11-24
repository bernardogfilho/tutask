require 'spec_helper'

describe "Topics" do
  describe "GET projects/1/topics" do
    it "works! (now write some real specs)" do
      @project = FactoryGirl.create :project
      get project_topics_path project_id: "1" 
      response.status.should be(200)
    end
  end
end
