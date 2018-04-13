require 'manager'
require 'pg'
require_relative './features/fill_helper'

describe Manager do
  describe ".all" do
    it "returns all bookmarks" do
      fill_links

      bookmarks = Manager.all
      expect(bookmarks).to include("http://google.com")
      expect(bookmarks).to include("http://stackoverflow.com")
      expect(bookmarks).to include("http://youtube.com")
    end
  end

  describe ".add" do
    it "adds a new bookmark to the bookmarks list" do
      Manager.add("http://testlink.com")
      expect(Manager.all).to include "http://testlink.com"
    end
  end
end
