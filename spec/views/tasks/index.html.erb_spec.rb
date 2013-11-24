require 'spec_helper'

describe "projects/1/tasks/index" do
  before(:each) do
    assign(:tasks, [
      stub_model(Task),
      stub_model(Task)
    ])
  end

  it "renders a list of tasks" do
    pending
    render project_tasks_path
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
