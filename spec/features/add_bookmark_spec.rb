require 'pg'

feature "Adding new bookmark" do
  scenario "Using a form to enter and submit new bookmark" do
    visit "/bookmarks/new"

    fill_in "new_bookmark", with: "http://makersacademy.com"
    click_button("Add")

    expect(page).to have_content "http://makersacademy.com"
  end

  scenario "adds bookmark if url is valid" do
    visit "/bookmarks/new"
    
    fill_in "new_bookmark", with: "some string"
    click_button "Add"

    expect(page).to have_content "Invalid url."
  end
end
