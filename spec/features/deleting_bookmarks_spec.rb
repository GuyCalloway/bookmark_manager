feature 'deleting bookmarks' do
  scenario 'A user can see Bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.create(url: "http://destroyallsoftware.com", title: "destroyer")
    visit ('/bookmarks')
    expect(page).to have_link('destroyer', href: "http://destroyallsoftware.com")

    click_button 'Delete'
    expect(page).not_to have_link('destroyer', href: "http://destroyallsoftware.com")
  end
end
