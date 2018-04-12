require 'pg'

p "Using test database."

 con = PG.connect(dbname: 'bookmark_manager_test')
 con.exec("TRUNCATE TABLE bookmarks;")
