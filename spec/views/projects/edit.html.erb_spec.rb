require 'spec_helper'

describe "projects/edit" do
  before(:each) do
    @project = FactoryGirl.create :project
  end

  it "renders the edit project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_path(@project), "post" do
    end
  end
end
