require 'manager'
require 'pg'
require_relative './features/fill_helper'

describe Manager do
  describe ".all" do
    it "returns an array of all bookmarks" do
      fill_links

      bookmarks = Manager.all
      expect(bookmarks).to include("http://google.com")
      expect(bookmarks).to include("http://stackoverflow.com")
      expect(bookmarks).to include("http://youtube.com")
    end
  end
end
