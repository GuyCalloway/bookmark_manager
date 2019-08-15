require 'pg'

class Bookmark

   attr_reader :title, :url

  def initialize(id:, url:, title:)
    @title = title
    @url = url
    @id = id
  end

  def self.all
    #return false unless is_url?(url)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec('SELECT * FROM bookmarks;')

    result.map do |bookmark|
      Bookmark.new(
        id: bookmark['id'],
        url: bookmark['url'],
        title: bookmark['title']
      )
    end

  end

  def self.create(url:, title:)
    #create self. select_env put if else into there and call
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.select_environment
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
  end

end
