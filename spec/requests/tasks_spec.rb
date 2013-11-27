require 'spec_helper'

describe "Tasks" do
  describe "GET /projects/1/tasks" do
    before do
      @project = FactoryGirl.create :project
    end
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get project_tasks_path project_id: @project.id
      response.status.should be(200)
    end
  end
end
