require 'spec_helper'

describe "tasks/edit" do
  before(:each) do
    @task = FactoryGirl.create :task
  end

  it "renders the edit task form" do
    pending
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_task_path(@task.project), "post" do
    end
  end
end
