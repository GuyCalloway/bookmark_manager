require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.create(url: 'http://www.google.com', title: 'google')
      Bookmark.create(url: 'http://destroyallsoftware.com', title: 'destroyer')

      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq(2)
      expect(bookmarks.first.title).to eq 'google'
    end
  end


describe '.create' do
  it 'creates a new bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: "test")
    bookmarks = Bookmark.all
    expect(bookmarks.first.url).to eq 'http://www.testbookmark.com'
    expect(bookmarks.first.title).to eq 'test'
  end
end
end
