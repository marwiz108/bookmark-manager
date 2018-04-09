require 'bookmark'

describe Bookmark do
  describe ".all" do
    it "returns an array of all bookmarks" do
      bookmarks = Bookmark.all
      expect(bookmarks).to include("https://www.google.co.uk/")
      expect(bookmarks).to include("https://www.youtube.com/")
      expect(bookmarks).to include("https://www.makersacademy.com/")
    end
  end
end
