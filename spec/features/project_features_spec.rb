require 'spec_helper'

feature 'Project Features' do
  include Features::SessionHelpers

  background do
    @user = FactoryGirl.create :user
    sign_in @user
  end

  context 'Create' do
    
    background do
      visit 'projects/new'
    end

    scenario 'with correct inputs' do
      fill_in 'project[title]', with: 'Project title'
      fill_in 'project[description]', with: 'Project description'
      click_on 'Save'
    end

    scenario 'with incorrect inputs' do
      click_on 'Save'
    end

  end

  context 'Update' do

    background do
      FactoryGirl.create :project
      visit 'projects/1/edit'
    end

    scenario 'with correct inputs' do
      fill_in 'project[title]', with: 'Updated title'
      fill_in 'project[description]', with: 'Updated description'
      click_on 'Save'
    end

    scenario 'with incorrect inputs' do
      fill_in 'project[title]', with: ''
      click_on 'Save'
    end
  end

  context 'Destroy' do
    
    background do
      FactoryGirl.create :project
      visit 'projects/1'
    end

    scenario 'successfully' do
      click_on 'Delete'
      # page.driver.browser.switch_to.alert.accept
    end
  end

end