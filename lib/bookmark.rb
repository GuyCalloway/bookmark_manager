require 'pg'

class Bookmark
  def self.all
    #return false unless is_url?(url)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    bookmarks_db = connection.exec('SELECT * FROM bookmarks;')
    bookmarks_db.map{ |bookmark| bookmark['title'], url}
  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', #{title}') RETURNING id, title, url;")
  end

end
