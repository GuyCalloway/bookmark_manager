

feature 'adding a bookmark' do
    scenario 'adding bookmark' do

    visit ('/bookmarks/new')
    fill_in('url', with: "http://www.test.com")
    fill_in('title', with: "test")
    click_button 'Submit'
    expect(page).to have_content('test')
  end
end
