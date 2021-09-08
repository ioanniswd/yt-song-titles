# yt-song-titles

Did YouTube delete videos on your playlists?

Is the video no longer available in your country?

Do you find yourself unable to remember the name of that song that YouTube deleted without even telling you about it?

Are you unwilling to download all playlists in your YouTube account just in case a video gets deleted and your never EVER find it again?


#### Fear not! For the solution is here!

# Requirements
- Ruby
- [youtube-dl](https://github.com/ytdl-org/youtube-dl)

# Instructions

### Clone the repo
```sh
$ git clone https://github.com/ioanniswd/yt-song-titles
$ cd yt-song-titles
```

### Get the playlist URLs
- Visit the YouTube [home page](www.youtube.com) with your browser and make sure you are logged in.
- Open the console(Right click > Inspect or Ctrl+Shift+I).
- Copy and paste the code found in `get_playlist_urls.js`.
- Copy the output from the console and paste it as is, in a file named `playlist_urls` placed in the repo folder. This file is ignored by git as it is different for each user.
- Execute the script which gets the song titles with: `$ ./update_song_lists.rb`. Make sure the file is executable.

Et Voilà! A file named `all_song_titles_by_playlist_title.json` will be created in the repo folder, and it will contain all song titles, grouped by playlist title. The format is like the following:

```
{
  "Rock": [
    "Black Sabbath - Killing Yourself to Live(Lyrics)",
    "Black Sabbath - Sweet leaf lyrics"
  ],
  "classical": [
    "The Flower Duet (Lakmé)",
    "Sebastian Bach- Toccata and Fugue in D minor",
    "Piotr Ilich Tchaikovsky - Power and Passion"
  ],
  "E.S. Posthumus": [
    "E.S. Posthumus - Pompeii",
    "E.S Posthumus - Anumati",
    "E.S. Posthumus - Tikal"
  ]
}
```

Note: Subsequent executions of the script will only add new song titles, it will never remove a song title once it has been saved in the file.

#### Never lose your songs again!

# License

This tool is open source under the [MIT License](https://opensource.org/licenses/MIT) terms.

[[Back To Top]](#yt-song-titles)
