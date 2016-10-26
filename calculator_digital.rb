@historic = []
@memory = []
# @digi_arr = []

@a = 0
@b = 0
@x = ""

def history
  puts @historic[0..20]
end

def reset
  puts 0
  @a = 0
  @b = 0
  menu
end

def plus
  puts "Calculating result..."
  puts @a + @b
  @historic << "#{@a} '+' #{@b} '=' #{@a + @b}"
  @a = @a + @b
  digital_02
end

def minus
  puts "Calculating result..."
  puts @a - @b
  @historic << "#{@a} '-' #{@b} '=' #{@a + @b}"
  @a = @a - @b
  operator
end

def multiply
  puts "Calculating result..."
  puts @a * @b
  @historic << "#{@a} '*' #{@b} '=' #{@a + @b}"
  @a = @a * @b
  operator
end

def divide
  puts "Calculating result..."
  puts @a / @b
  @historic << "#{@a} '/' #{@b} '=' #{@a + @b}"
  @a = @a / @b
  operator
end

def result
	case @x
    when '+'
	  	plus
	  when '-'
	  	minus
	  when '*'
	  	multiply
	  when '/'
	  	divide
    when 'c'
	  	reset
	  else
	  	puts 'This is an egg adder, not a scientific calculator!'
	  end
end

# def first
#   puts "What is your first number?"
#   @a = gets.to_f
#   operator
# end
#
# def operator
#   puts "What is your operator?"
#   puts "|c| reset |h| history"
#   @x = gets.strip
#   if @x == 'c'
#     reset
#   elsif @x == 'h'
#     history
#   else
#     second
#   end
# end
# def second
#   puts "What is your second number?"
#   @b = gets.to_f
#   result
# end

def digital
  puts "Write your operation"
  digi_operation = gets.strip
  split_operation = digi_operation.split(/(\/|\+|\*|-)|d+/)
  @a = split_operation.first.to_f
  @b = split_operation.last.to_f
  @x = split_operation[1]
  result
end
def digital_02
  puts "Write your operation"
  puts "|c| reset |h| history |m| memory"
  puts ""
  print @a
  digi_operation_02 = gets.strip
  split_operation = digi_operation_02.split(/(\/|\+|\*|-)|d+/)
  @b = split_operation.last.to_f
  @x = split_operation[1].to_s
    if @x == 'c'
      reset
    elsif @x == 'h'
      history
    elsif @x == 'm'
      @memory << @a
    else
      result
    end
end
def menu
  puts "---- Welcome to the super cool EggAdder 2000 ----"
  puts "Press (1) for EggAdder"
  puts "Press (2) for DigitalEggAdder"
  puts "Press (3) for exit"
  choice = gets.to_i
  case choice
  when 1
    first
  when 2
    digital
  when 3
    exit
  else
    puts "Enter a valid choice!"
    menu
  end
end


while true
  menu
end
