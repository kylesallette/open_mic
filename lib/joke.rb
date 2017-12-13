require 'csv'
require 'pry'
require_relative 'user'

class Joke

  attr_reader :answer,
              :question,
              :id

  def initialize(joke)
    @question =  joke[:question]
    @answer = joke[:answer]
    @id = joke[:id]
  end

end
