# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp.html) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.

class TowersOfHanoi
  attr_reader :towers, :discs
  def initialize
    @towers = [[3, 2, 1],[],[]]
    @won = false
    @round = 1
  end

  def play
      system("clear")
    puts "==============================================================================================="
    puts "                                THE TOWERS OF HANOI"
   puts "================================================================================================"
   puts "\"Greetings, I am the Great Wizard Fibonacci!  I command you to solve this disc puzzle."
   puts "The rules are simple: you win if you can get all three discs onto the second or third tower"
   puts "You may move only one at a time, and you may only place  disc onto an empty tower, or onto"
   puts "a larger disc.  For example, you may not stack the size-3 disc on top of a size-1 disc"
   puts "Now, be careful with this Hanoi set, it's made of mahogany!!!\""
   print "HIT ENTER TO CONTINUE > "
   dummy = gets.chomp
   system("clear")
    until won?
      clone = []
      @towers.each {|sub_arr| clone << sub_arr.dup}
      render(clone)
      puts "Please select a tower from which you'd like to move a disc. (1-3)"
      from_input = gets.chomp.to_i
      puts "Please select a tower to move it to (1-3)"
      to_input = gets.chomp.to_i
      move(from_input, to_input)
      @round += 1
      system("clear")
    end
    puts "CONGLATURATION! A WINNER IS YOU!"
  end

  def render(arr)
    arr.each do |sub_arr|
      until sub_arr.length == 3
        sub_arr.push(0)
      end
    end
    puts "==============================================================================================="
    puts "                                THE TOWERS OF HANOI"
    puts "==============================================================================================="
    puts " "*(7-arr[0][2]) + "*"*arr[0][2] + "    " + "*"*arr[1][2] + "     " + "*"*arr[2][2]
    puts " "*(7-arr[0][1])+ "*"*arr[0][1] + "    " + "*"*arr[1][1] + "     " + "*"*arr[2][1]+
    puts  " "*(7-arr[0][0]) + "*"*arr[0][0] + "   "+ "*"*arr[1][0] + "     " + "*"*arr[2][0]
    puts  "    |1|   |2|  |3|"
    puts  "===================================ROUND#{@ROUND==============================================="
  end

  def won?
    puts @towers.inspect
    return true if @towers[1].length == 3 or @towers[2].length == 3
    return false
  end

  def valid_move?(from_input, to_input)
  #    @towers[from_input-1], @towers[to_input-1]
      return false if @towers[from_input-1].empty?
      return true if @towers[to_input-1].empty? == true
      return true if @towers[from_input-1].last < @towers[to_input-1].last
      return false
  end

  def move(from_input, to_input)
      if valid_move?(from_input, to_input)
          # The stuff that was commented out was useful for the "user input" version
         @towers[to_input-1] <<  @towers[from_input-1].pop
         #@towers[to_input].shift
         #@towers[from_input].unshift(0)
      else
         puts "Fibonacci says \"NO, NO NO! That's an invalid move! Try again! \""
         print "Hit enter to continue"
         dummy = gets.chomp
       end

  end

end
