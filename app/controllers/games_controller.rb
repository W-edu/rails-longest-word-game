require 'json'
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
    # word = JSON.parse(open("#{@base_url}#{@answer}").read)
    jason = open(url).read
    word = JSON.parse(jason)
    word[:found] ? @score = @answer.length : @score = 0
  end
end
