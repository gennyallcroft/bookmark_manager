feature 'user can update a bookmark' do
  scenario 'user updates the bookmark' do
    visit('/')
    click_on('View bookmarks')
    click_on('Add')
    fill_in 'url', with: ("http://bbc.co.uk")
    fill_in 'title', with: ('BBC')
    click_on('Add')
    click_on("e#{BookmarkManager.show_bookmarks.first.id}")
    fill_in 'title', with: 'BBC News'
    click_on('Save')
    expect(page).to have_content 'BBC News'
  end
end
