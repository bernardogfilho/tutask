require 'spec_helper'

feature 'Comment' do
  
  background do
    @topic = FactoryGirl.create :topic
  end

  context 'Index' do
    background do
      @comment = FactoryGirl.create :comment, topic: @topic
      visit '/projects/1/topics/1/'  
    end
    scenario 'returns all comments from a topic' do
      expect(page).to have_content @comment.content
    end
  end

  context 'Create' do
    background do
      visit '/projects/1/topics/1'
    end
    scenario 'with correct inputs' do
      fill_in 'comment[content]', with: 'Hey, nice topic!'
      click_on 'Comment'
      expect(page).to have_content 'Hey, nice topic!'
    end
  end

  context 'Update' do
    background do
      @comment = FactoryGirl.create :comment, topic: @topic
      visit '/projects/1/topics/1/'
      click_link 'Edit Comment'
    end
    scenario 'with correct inputs' do
      fill_in 'comment[content]', with: 'Hey, I just updated my comment.'
      click_on 'Update Comment'
      expect(page).to have_content 'Hey, I just updated my comment.'
    end
    scenario 'with incorrect inputs' do
      fill_in 'comment[content]', with: ''
      click_on 'Update Comment'
      # expect(page).to have_css '.alert.error'
    end
  end

  context 'Destroy' do
    background do
      @comment = FactoryGirl.create :comment, topic: @topic
      visit '/projects/1/topics/1/'
    end
    scenario 'successfully' do
      click_on 'Delete Comment'
      expect(page).to have_no_content(@comment.content)
    end
  end

end