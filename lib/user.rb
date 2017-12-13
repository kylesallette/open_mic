require_relative 'joke'

class User
  attr_reader :name,
              :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
   jokes << joke
  end

  def perform_routine_for(user)
    jokes.map do |routine|
      user.learn(routine)
    end
  end

#  def learn_routine('../jokes.csv')
#    CSV.foreach('../jokes.csv', :headers => true) do |row|
#      learn(row)
#  end

  def tell(user, joke)
    user.learn(joke)
  end

end
