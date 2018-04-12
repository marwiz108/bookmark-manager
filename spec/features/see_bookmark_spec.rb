require 'pg'
require_relative './fill_helper'

feature "Viewing bookmarks" do
  scenario "User can view all the bookmarks" do
    fill_links

    visit "/bookmarks"

    expect(page).to have_content "http://google.com"
    expect(page).to have_content "http://stackoverflow.com"
    expect(page).to have_content "http://youtube.com"
  end
end
