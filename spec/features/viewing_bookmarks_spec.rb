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
    Bookmark.create(url: "http://destroyallsoftware.com", title: "destroyer")
    Bookmark.create(url: "http://www.google.com", title: "google")

    visit ('/bookmarks')
    expect(page).to have_content "destroyer", "google"
    
  end
end

# As a time-pressed user
# So that I can save a website
# I would like to add the site's address and title to bookmark manager
