require 'spec_helper'

feature 'Task Features' do
  include Features::SessionHelpers

  background do
    @user = FactoryGirl.create :user
    sign_in @user
    @project = FactoryGirl.create :project
  end

  context 'Create' do
    
    background do
      visit 'projects/1/tasks/new'
    end

    scenario 'with correct inputs' do
      fill_in 'task[title]', with: 'Task title'
      fill_in 'task[description]', with: 'Task description'
      click_on 'Save'
    end

    scenario 'with incorrect inputs' do
      fill_in 'task[title]', with: ''
      click_on 'Save'
    end

  end

  context 'Update' do

    background do
      @task = FactoryGirl.create :task
      visit edit_project_task_path(@task.project, @task)
    end

    scenario 'with correct inputs' do
      fill_in 'task_title', with: 'Updated title'
      fill_in 'task_description', with: 'Updated description'
      click_on 'Save'
    end

    scenario 'with incorrect inputs' do
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