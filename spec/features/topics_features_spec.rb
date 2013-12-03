require 'spec_helper'

feature 'Topics features' do
  include Features::SessionHelpers

  background do
    @user = FactoryGirl.create :user
    sign_in @user
    @project = FactoryGirl.create :project, owners: [@user], users: [@user]
  end

  context 'Index' do
    background do
      @topic = FactoryGirl.create :topic, project: @project
      visit  "projects/#{@project.id}/topics"
    end

    scenario 'returns all saved topics' do
      expect(page).to have_content @topic.title
    end
  end

  context 'Create' do
    background do
      visit "projects/#{@project.id}/topics/new"
    end
    context 'with correct inputs' do
      background do
        fill_in 'topic[title]', with: 'Topic title'
        fill_in 'topic[content]', with: 'Topic content'
        click_on 'Save'
      end
      scenario 'it saves and display the topic' do
        expect(page).to have_content 'Topic content'
      end

      scenario 'it saves and display the author' do
        expect(page).to have_content @user.email
      end
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
      @topic = FactoryGirl.create :topic, project: @project
      visit "projects/#{@project.id}/topics/#{@topic.id}/edit"
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

  context 'Destroy' do
    
    background do
      @topic = FactoryGirl.create :topic, project: @project
      visit "projects/#{@project.id}/topics/#{@topic.id}"
    end

    scenario 'successfully' do
      click_on 'Delete'
    end
  end

end