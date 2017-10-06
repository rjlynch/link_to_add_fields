require 'spec_helper'

describe 'LinkToAddFields', type: :feature, js: true do
  let(:hidden_destroy_field) do
    page.all('input[type="hidden"]', visible: false)[1]
  end

  let(:second_remove_comment_link) do
    all('a', text: 'Remove comment')[1]
  end

  let(:comment_field) do
    find_field('Comment')
  end

  before :each do
    visit 'posts/new'
  end

  context 'Adding fields' do
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
      click_link 'Remove comment'
      expect(page).not_to have_content 'Comment'
      expect(page).not_to have_content 'test'
    end

    it 'only removes the closest target field' do
      click_link 'Add comment'
      second_remove_comment_link.click
      expect(page).to have_content 'Comment', count: 1
      expect(page).to have_content 'Remove comment', count: 1
      expect(comment_field.value).to eq 'test'
    end

    it 'sets destroy field' do
      click_link 'Remove comment'
      expect(hidden_destroy_field.value).to eq '1'
    end
  end
end
