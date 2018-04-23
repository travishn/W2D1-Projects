# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    puts "Invalid string to integer input. Please try again."
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise ArgumentError.new("Since you gave me coffee... I'll give you another chance.")
  else
    raise StandardError.new("I wanted a fruit not a number...")
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue ArgumentError => e
    puts e.message
    retry
  rescue StandardError => e
    puts e.message
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    raise "You can't be bestfriends if you've known each other for less than 5 years." if @yrs_known < 5
    raise "Why are you nameless?" if @name.length <= 0
    raise "You don't have a favorite past time?" if @fav_pastime.length <= 0
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known} years. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end

class NumberGuessError < StandardError
end


