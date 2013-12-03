require 'spec_helper'

feature 'Dashboard Features' do
  include Features::SessionHelpers

  background do
    @user = FactoryGirl.create :user
    sign_in @user
    @project = FactoryGirl.create :project, owners: [@user], users: [@user]
  end

  context 'Index page' do

    background do
      visit "/dashboard"
    end
    
    scenario 'displays the projects the user partipates' do
      expect(page).to have_content @project.title
    end

  end

end