require 'pg'

class Manager

  def self.all
    if ENV["ENVIRONMENT"] == "test"
      @con = PG.connect(dbname: 'bookmark_manager_test')
    else
      @con = PG.connect(dbname: 'bookmark_manager')
    end
    links = @con.exec("SELECT * FROM bookmarks;")
    links.map { |row| row['url'] }
  end

  def self.add(new)
    @con.exec_params("INSERT INTO bookmarks (url) VALUES ($1)", [new])
  end

end
