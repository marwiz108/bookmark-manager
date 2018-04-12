require 'pg'

feature "Viewing bookmarks" do
  scenario "User can view all the bookmarks" do
    con = PG.connect(dbname: 'bookmark_manager_test')
    con.exec("INSERT INTO bookmarks (url) VALUES ('http://google.com');")
    con.exec("INSERT INTO bookmarks (url) VALUES ('http://stackoverflow.com');")
    con.exec("INSERT INTO bookmarks (url) VALUES ('http://youtube.com');")

    visit "/"

    expect(page).to have_content "http://google.com"
    expect(page).to have_content "http://stackoverflow.com"
    expect(page).to have_content "http://youtube.com"
  end
end
