require 'spec_helper'

feature 'Topics features' do
  include Features::SessionHelpers

  background do
    @user = FactoryGirl.create :user
    sign_in @user
    @project = FactoryGirl.create :project
  end

  context 'Create' do
    
    background do
      visit 'projects/1/topics/new'
    end

    scenario 'with correct inputs' do
      fill_in 'topic[title]', with: 'Topic title'
      fill_in 'topic[content]', with: 'Topic content'
      click_on 'Save'
    end

    context 'with incorrect inputs' do
      
      scenario 'in title input' do
        fill_in 'topic[title]', with: ''
        click_on 'Save'
      end

      scenario 'in content input' do
        fill_in 'topic[content]', with: ''
        click_on 'Save'
      end
      
    end

  end

end