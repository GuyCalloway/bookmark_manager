require 'pg'

feature 'viewing bookmarks' do
  scenario 'visiting the index page' do
    visit ('/')
    expect(page).to have_content("Book Manager")
  end
end

feature 'viewing bookmarks' do
  scenario 'A user can see Bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.create(url: "http://destroyallsoftware.com")
    Bookmark.create(url: "http://www.google.com")

    visit ('/bookmarks')
    expect(page).to have_content "http://destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end

# As a time-pressed user
# So that I can save a website
# I would like to add the site's address and title to bookmark manager
