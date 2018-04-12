require 'pg'

def fill_links
  con = PG.connect(dbname: 'bookmark_manager_test')
  con.exec("INSERT INTO bookmarks (url) VALUES ('http://google.com');")
  con.exec("INSERT INTO bookmarks (url) VALUES ('http://stackoverflow.com');")
  con.exec("INSERT INTO bookmarks (url) VALUES ('http://youtube.com');")
end
