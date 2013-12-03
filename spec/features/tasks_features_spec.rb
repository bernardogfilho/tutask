require 'spec_helper'

feature 'Task Features' do
  include Features::SessionHelpers

  background do
    @user = FactoryGirl.create :user
    sign_in @user
    @project = FactoryGirl.create :project, owners: [@user]
  end

  context 'Index' do
    background do
      @todo_task = FactoryGirl.create :todo, project: @project, owner: @user, users: [@user]
      @completed_task = FactoryGirl.create :completed, project: @project, owner: @user, users: [@user]
      visit '/tasks'
    end

    scenario 'page list the todo tasks' do
      expect(page).to have_content @todo_task.title
    end

    scenario 'page list the completed tasks' do
      expect(page).to have_content @completed_task.title
    end
  end

  context 'Create' do
    
    background do
      visit 'projects/1/tasks/new'
    end

    scenario 'with correct inputs create the task successfully' do
      fill_in 'task[title]', with: 'Task title'
      fill_in 'task[description]', with: 'Task description'
      click_on 'Save'
    end

    scenario 'with incorrect inputs displays a message error amd doest not create the task' do
      fill_in 'task[title]', with: ''
      click_on 'Save'
    end

  end

  context 'Update' do

    background do
      @task = FactoryGirl.create :task
      visit edit_project_task_path(@task.project, @task)
    end

    scenario 'with correct inputs update the task successfully' do
      fill_in 'task_title', with: 'Updated title'
      fill_in 'task_description', with: 'Updated description'
      click_on 'Save'
    end

    scenario 'with incorrect inputs does not create the task and displays a message error' do
      fill_in 'task_title', with: ''
      click_on 'Save'
    end
  end

  context 'Destroy' do
    
    background do
      FactoryGirl.create :task
      visit 'projects/1/tasks/1'
    end

    scenario 'successfully' do
      click_on 'Delete'
      # page.driver.browser.switch_to.alert.accept
    end
  end

end