require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ("a".."z").to_a.sample(10)
  end

  def score
    # raise
    @answer = params[:answer]
    @letters = params[:letters].split
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    word = JSON.parse(open(url).read)
    word["found"] ? @score = @answer.length : @score = 0
  end
end
