require 'spec_helper'

feature 'Topics features' do
  include Features::SessionHelpers

  background do
    @user = FactoryGirl.create :user
    sign_in @user
    @project = FactoryGirl.create :project
  end

  context 'Index' do
    background do
      visit  'projects/1/topics'
      @topic = FactoryGirl.create :topic
    end

    scenario 'returns all saved topics' do
      expect(page).to have_content @topic.title
    end
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

  context 'Update' do
    
    background do
      @topic = FactoryGirl.create :topic
      visit 'projects/1/topics/1/edit'
    end

    scenario 'with correct inputs' do
      fill_in 'topic[title]', with: 'Updated title'
      fill_in 'topic[content]', with: 'Updated content'
      click_on 'Save'
    end

    context 'with incorrect inputs' do
      
      scenario 'title input' do
        fill_in 'topic[title]', with: ''
        click_on 'Save'
      end

      scenario 'content input' do
        fill_in 'topic[content]', with: ''
        click_on 'Save'
      end
    end
  end

end