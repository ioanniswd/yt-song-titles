#!/usr/bin/env ruby
require 'json'

SONG_TITLES_FILEPATH = 'all_song_titles_by_playlist_title.json'.freeze
PLAYLIST_URLS_FILEPATH = 'playlist_urls'.freeze

if !File.exists?(PLAYLIST_URLS_FILEPATH)
  raise 'Playlists urls file not found'
end

playlist_urls = File.readlines('playlist_urls', chomp: true).grep(/playlist/)

if File.exists?(SONG_TITLES_FILEPATH)
  all_song_titles_by_playlist_title = JSON.parse(File.read(SONG_TITLES_FILEPATH))
else
  all_song_titles_by_playlist_title = {}
end

playlist_urls.each do |path|
  puts "Updating playlist with path: #{path}"

  command = "youtube-dl --flat-playlist --dump-single-json https://www.youtube.com#{path}"
  playlist_info = JSON.parse(`#{command}`)

  playlist_title = playlist_info['title']

  puts "Playlist title: #{playlist_title}\n"

  playlist_song_titles = playlist_info['entries'].map { |entry| entry['title'] }
  all_song_titles_by_playlist_title[playlist_title] ||= []

  new_song_titles = playlist_song_titles - all_song_titles_by_playlist_title[playlist_title]
  all_song_titles_by_playlist_title[playlist_title] += new_song_titles
rescue => e
  puts "\n----- Failed to update playlist -----\n"
end

puts 'Writting to file'

File.write(SONG_TITLES_FILEPATH, JSON.pretty_generate(all_song_titles_by_playlist_title))

puts 'Done'
