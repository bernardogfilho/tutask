require 'spec_helper'

feature 'Project Features' do
  include Features::SessionHelpers

  background do
    @user = FactoryGirl.create :user
    sign_in @user
  end

  context 'Show' do
    
    background do
      @project = FactoryGirl.create :project, owners: [@user], users: [@user]
      @todo_task = FactoryGirl.create :todo, project: @project, owner: @user, users: [@user]
      @completed_task = FactoryGirl.create :completed, project: @project, owner: @user, users: [@user]

      visit "projects/#{@project.id}"
    end

    scenario 'page displays the project name' do
      expect(page).to have_content @project.title
    end

    scenario 'page displays the project description' do
      expect(page).to have_content @project.description
    end

    scenario 'page displays the project owners' do
      expect(page).to have_content @project.owners.first.email
    end

    scenario 'page displays the last five todo tasks' do
      expect(page).to have_content @todo_task.title
    end

    scenario 'page displays the last completed tasks' do
      expect(page).to have_content @completed_task.title
    end

  end

  context 'Create' do
    
    background do
      visit 'projects/new'
    end

    context 'with correct inputs' do
      background do
        fill_in 'project[title]', with: 'Project title'
        fill_in 'project[description]', with: 'Project description'
        click_on 'Save'
      end
      scenario 'it displays the project' do
        expect(page).to have_content 'Project title'
      end
      scenario 'it displays the owner of the project' do
        expect(page).to have_content @user.email
      end
      
    end

    scenario 'with incorrect inputs' do
      click_on 'Save'
    end

  end

  context 'Update' do

    background do
      @project = FactoryGirl.create :project, owners: [@user]
      visit "projects/#{@project.id}/edit"
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
      @project = FactoryGirl.create :project, owners: [@user]
      visit "projects/#{@project.id}"
    end

    scenario 'successfully' do
      click_on 'Delete'
      # page.driver.browser.switch_to.alert.accept
    end
  end

end