require 'simplecov'
SimpleCov.start
require 'json'
require 'rspec'

require_relative 'jukebox'
require_relative 'song'

test_songs = [
 "The Phoenix - 1901",
 "Tokyo Police Club - Wait Up",
 "Sufjan Stevens - Too Much",
 "The Naked and the Famous - Young Blood",
 "(Far From) Home - Tiga",
 "The Cults - Abducted",
 "The Phoenix - Consolation Prizes"
]

describe "Song" do

  it "can be initialized" do
    song = Song.new("Step Right Up")
    song.should be_an_instance_of(Song)
  end

  it "can have a name" do
    song = Song.new("Hit the Lights")
    song.name.should eq("Hit the Lights")
  end

end

describe "Jukebox" do

  let(:song_objects) { test_songs.
    map { |test_song| Song.new(test_song) }
  }
  let(:jukebox) { Jukebox.new(song_objects) }
  let(:instructions) {
    "Please select help, list, exit, or play."
  }

  it "can be initialized" do
    jukebox.should be_an_instance_of(Jukebox)
  end

  it "is on" do
    jukebox.on?.should eq(true)
  end

  it "offers instructions" do
    jukebox.help.should eq(instructions)
  end

  describe "with songs" do

    it "has songs" do
      jukebox.songs.should eq(song_objects)
    end

    describe "with approved command input" do

      let(:list_response) {
        test_songs.each_with_index.map {
          |test_song, i| "#{i+1} #{test_song}\n"
          }.join
      }

      it "accepts a list command" do
        jukebox.command("list").should eq(list_response)
      end

      it "accepts a help command" do
        jukebox.command("help").should eq(instructions)
      end      

      it "accepts an exit command" do
        jukebox.command("exit")
        jukebox.on?.should eq(false)
      end      

    end

    describe "with play command" do

      it "plays requested song" do
        jukebox.command("play Wait Up").
          should eq("now playing Wait Up")
      end

    end

    describe "with an invalid command" do

      it "gives \"invalid command\" message" do
        jukebox.command("garbage").
          should eq("invalid command")
      end

    end

  end

end
