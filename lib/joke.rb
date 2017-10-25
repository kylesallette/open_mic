require 'csv'

class Joke



  def initialize
  #  sorry, failed horribly.
  end



  def joke_finder

  id = {}

  CSV.foreach("../jokes.csv", :headers => true, :header_converters => :symbol, :converters => :all) do |row|
    id[row.fields[0]] = Hash[row.headers[1..-1].zip(row.fields[1..-1])]

    p id[1]
    end
  end

end


   joke = Joke.new
   joke.joke_finder
