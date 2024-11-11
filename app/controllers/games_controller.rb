class GamesController < ApplicationController

  def new
    vowels = ['A', 'E', 'I', 'O', 'U']
    consonants = ('A'..'Z').to_a - vowels
    @letters = Array.new(4) { vowels.sample }
    @letters += Array.new(6) { consonants.sample }
    @letters.shuffle!
  end

  def score

  end

  def english_word?(word)
    require 'open-uri'
    require 'json'
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    response = URI.open(url).read
    @json = JSON.parse(response)
    @json['found']
  end

end
