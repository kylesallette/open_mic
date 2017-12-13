require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/user'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test_it_can_learn_jokes
    ali = User.new("Ali")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    ali.learn(joke)

    assert_equal "Why did the strawberry cross the road?", joke.question
  end

  def test_it_can_learn_multiple_jokes
    ali = User.new("Ali")
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
    joke_3 = Joke.new({id: 3, question: "What is the best way to keep water from running?", answer: "Don’t pay the water bill"})

    ali.learn(joke_1)
    ali.learn(joke_2)
    ali.learn(joke_3)

    assert_equal 3, ali.jokes.count
  end


  def test_user_can_tell_jokes
    ali = User.new("Ali")
    sal = User.new("Sal")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})

    sal.tell(ali, joke)

    assert_instance_of Joke , ali.jokes[0]
  end

  def test_other_user_can_learn_jokes
    ali = User.new("Ali")
    sal = User.new("Sal")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})

    ali.tell(sal, joke)

    assert_instance_of Joke , sal.jokes[0]
  end

  def test_after_hearing_joke_count_is_right
    ali = User.new("Ali")
    sal = User.new("Sal")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})

    ali.tell(sal, joke)

    assert_equal 1, sal.jokes.count
  end


  def test_user_can_perform_routine
    ali = User.new("Ali")
    sal = User.new("Sal")
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})

    ali.learn(joke_1)
    ali.learn(joke_2)
    ali.perform_routine_for(sal)

    assert_equal 2, sal.jokes.count
  end

end
