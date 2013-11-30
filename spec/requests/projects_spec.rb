require 'spec_helper'

describe "Projects" do
  include Features::SessionHelpers
  describe "GET /projects" do
    it "works! (now write some real specs)" do
      pending "is not really necessary"
      @user = FactoryGirl.create :user
      get projects_path
      response.status.should be(200)
    end
  end
end
