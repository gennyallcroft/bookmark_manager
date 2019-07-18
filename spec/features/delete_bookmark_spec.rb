feature 'delete a bookmark' do
  scenario 'user can delete a bookmark' do
    visit '/'
    click_on 'View bookmarks'
    click_on 'Add'
    fill_in 'url', with: ("http://bbc.co.uk")
    fill_in 'title', with: ('BBC')
    click_on("Add")
    click_on("#{BookmarkManager.show_bookmarks.first.id}")
    expect(page).not_to have_content 'BBC'
  end
end
