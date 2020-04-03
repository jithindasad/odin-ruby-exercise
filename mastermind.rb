class Mastermind
  @@colors = ["red", "blue", "yellow", "green", "white", "black"]

  def initialize
    @code_pegs = []
    @user_pegs = []
  end

  def display_board
    @user_pegs.each_with_index do |color, index|
      print "  #{color}(#{index + 1})  "
    end
    puts
    print @code_pegs
    puts
  end

  def display_feedback(matching_color_and_location, matching_color)
    if matching_color == 0 && matching_color_and_location == 0
      puts "No match found!"
    else
      puts "matching colors on right location: #{matching_color_and_location}"
      puts "matching colors on wrong location: #{matching_color}"
    end
  end

  def check_row
    matching_color_and_location = 0
    matching_color = 0
    @user_pegs.each_with_index do |color, index|
      if @code_pegs.include?(color) && @code_pegs[index] == color
        matching_color_and_location += 1
      elsif @code_pegs.include?(color) && @code_pegs[index] != color
        matching_color += 1
      end
    end
    display_feedback matching_color_and_location, matching_color
    return matching_color_and_location
  end

  def play(player)
    6.times do
      player.call
      display_board
      matches = check_row
      if matches == 4
        puts "you won!"
        p @@colors
        break
      else
        puts "computer won!"
      end
      @user_pegs.clear
    end
  end

  def check_computer_guess
    6.times do
      computer_play
      puts "computer entered:"
      display_board
      matches = check_row
      if matches == 4
        puts "computer won!"
        p @@colors
        break
      else
        puts "computer failed!"
      end
      @user_pegs.clear
    end
  end

  def get_code_master
    code_master = Proc.new do
      puts "Enter four colors from: #{@@colors}"
      4.times do |color_location|
        print "Enter color(#{color_location + 1}): "
        input = gets.chomp
        if input.match(/(red|blue|yellow|green|white|black)/)
          @code_pegs << input
        else
          puts "Invalid color! Try again."
          redo
        end
      end
    end
  end

  def get_code_braker
    code_braker = Proc.new do
      puts "Enter four colors from: #{@@colors}"
      4.times do |color_location|
        print "Enter color(#{color_location + 1}): "
        input = gets.chomp
        if input.match(/(red|blue|yellow|green|white|black)/)
          @user_pegs << input
        else
          puts "Invalid color! Try again."
          redo
        end
      end
    end
  end

  def computer_play
    @user_pegs = @@colors.sample(4)
  end

  def start
    puts "Enter player Choice: \n 1. code braker \n 2. code master"
    choice = gets.chomp.to_i
    if choice == 1
      @code_pegs = generate_code_peg
      code_braker = get_code_braker
      play(code_braker)
    elsif choice == 2
      code_master = get_code_master
      code_master.call
      check_computer_guess
    else
      puts "Invalid input! try again"
    end
  end

  private

  def generate_code_peg
    @code_pegs = (@@colors.shuffle.sample(4))
  end
end





























p = Mastermind.new

p.start
# p.computer_play
# p.display_board
