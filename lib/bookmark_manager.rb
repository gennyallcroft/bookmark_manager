# frozen_string_literal: true

require 'pg'
require_relative './database_connection'

# this is the model for Bookmark Manager
class BookmarkManager

  attr_reader :id, :title, :url

  def initialize(id: id , title: title, url: url)
    @id = id
    @title = title
    @url = url
  end

  def self.show_bookmarks
    result = DatabaseConnection.query("SELECT * FROM bookmarks;")
    result.map do |bookmark|
      BookmarkManager.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(url: , title: )
    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title")
    BookmarkManager.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = '#{id}';")
  end

  def self.edit(id: , title: , url: )
    result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
    BookmarkManager.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id};")
    BookmarkManager.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end
end
