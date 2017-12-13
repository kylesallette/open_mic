require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/joke'

class JokeTest < Minitest::Test

  def setup
    @joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
  end

  def test_it_exists
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})

    assert_instance_of Joke, @joke
  end

  def test_joke_id
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})

    assert_equal 1, @joke.id
  end

  def test_joke_question
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})

    assert_equal "Why did the strawberry cross the road?", @joke.question
  end

  def test_joke_answer
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})

    assert_equal "Because his mother was in a jam.", @joke.answer
  end

end
