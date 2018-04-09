feature "Viewing bookmarks" do
  scenario "User can view all the bookmarks" do
    visit "/bookmarks"
    expect(page).to have_content "https://www.google.co.uk/"
    expect(page).to have_content "https://www.youtube.com/"
    expect(page).to have_content "https://www.makersacademy.com/"
  end
end
