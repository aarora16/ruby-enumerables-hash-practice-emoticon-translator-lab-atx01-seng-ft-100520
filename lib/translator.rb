require 'pry'
require "yaml"


def load_library(data)
  @raw_data = YAML.load_file('./lib/emoticons.yml')
  @emoticon_names = @raw_data.keys.map! {|name| name}
  @emoticons = Hash[@emoticon_names.map {|key, value| [key, Hash.new]}]
  
  english_and_japanese(data)
  get_japanese_emoticon(data)
  get_english_meaning(data)

  @emoticons
end


def english_and_japanese(data)
  @emoticons.each do |name|
    @emoticons[name[0]] = {english: [], japanese: []}
  end
end


def get_english_meaning(path, emoticon)
  @emoticon_names.each do |name|
    @emoticons[name][:english] = @raw_data[name][0]
  end
end


def get_japanese_emoticon(path, emoticon)
  @emoticon_names.each do |name|
    @emoticons[name][:japanese] = @raw_data[name][1]
  end
end