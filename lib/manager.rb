require 'pg'
require_relative './bookmark'

class Manager

  def self.all
    if ENV["ENVIRONMENT"] == "test"
      @con = PG.connect(dbname: 'bookmark_manager_test')
    else
      @con = PG.connect(dbname: 'bookmark_manager')
    end
    links = @con.exec("SELECT * FROM bookmarks;")
    links.map { |row| Bookmark.new(row ['id'], row['url']) }
  end

  def self.add(new)
    @con.exec("INSERT INTO bookmarks (url) VALUES ($1)", [new])
  end

end
