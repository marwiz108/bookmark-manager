require 'pg'

class Manager

  def self.all
    if ENV["ENVIRONMENT"] == "test"
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end

    @bookmarks = con.exec("SELECT * FROM bookmarks;").to_a
    @bookmarks.map { |row| row['url'] }
  end
end
