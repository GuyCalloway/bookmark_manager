feature 'update bookmarks' do
  scenario 'A user can update Bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.create(url: "http://destroyallsoftware.com", title: "destroyer")
    visit ('/bookmarks')

    click_button 'Update'

    fill_in('url', with: "http://www.test.com")
    fill_in('title', with: "test")
    click_button 'Submit'
    expect(page).to have_content('test')
  end
end
