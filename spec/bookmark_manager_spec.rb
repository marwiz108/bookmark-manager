require 'manager'
require 'pg'

describe Manager do
  describe ".all" do
    it "returns an array of all bookmarks" do
      con = PG.connect(dbname: 'bookmark_manager_test')
      con.exec("INSERT INTO bookmarks (url) VALUES ('http://google.com');")
      con.exec("INSERT INTO bookmarks (url) VALUES ('http://stackoverflow.com');")
      con.exec("INSERT INTO bookmarks (url) VALUES ('http://youtube.com');")

      bookmarks = Manager.all
      expect(bookmarks).to include("http://google.com")
      expect(bookmarks).to include("http://stackoverflow.com")
      expect(bookmarks).to include("http://youtube.com")
    end
  end
end
