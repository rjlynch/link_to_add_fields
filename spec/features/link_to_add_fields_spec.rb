require 'spec_helper'

describe 'LinkToAddFields', type: :feature, js: true do
  before :each do
    visit 'posts/new'
  end

  context 'Adding fields' do
    # test setup test
    it "doesn't already have comment fields" do
      expect(page).not_to have_content 'Comment'
    end

    it 'adds a fields' do
      click_link 'Add comment'
      expect(page).to have_content 'Comment'
    end
  end

  context 'Removing fields' do
    before :each do
      click_link 'Add comment'
      within '.comment_fields' do
        fill_in 'Comment', with: 'test'
      end
    end

    it 'removes the field wrapper' do
      fill_in 'Comment', with: 'test'
      expect(page).to have_content 'test'
      click_link 'Remove comment'
      expect(page).not_to have_content 'Comment'
      expect(page).not_to have_content 'test'
    end

    it 'only removes the closest target field' do
      click_link 'Add comment'
      expect(page).to have_content 'Comment', count: 2
      expect(page).to have_content 'Remove comment', count: 2
      all('a', text: 'Remove comment')[1].click
      expect(page).to have_content 'Comment', count: 1
      expect(page).to have_content 'Remove comment', count: 1
      expect(page).to have_content 'test'
    end

    it 'checks the destroy check box'
  end
end
