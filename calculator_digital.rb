#ARRAYS
@historic = []
@memory = []

# INITIAL VARIABLE SETTING
@a = 0
@b = 0
@x = ""
# OTHER FUNCTIONS
def history
  puts "--- Our great numeric history ---"
  puts ""
  puts @historic[0..20]
  puts "*" * 15
end

def reset
  puts 0
  @a = 0
  @b = 0
  digital
end
#OPERATORS METHODS
def plus
  puts "Calculating result..."
  puts (@a + @b).round(3)
  @historic << "#{@a} + #{@b} = #{(@a + @b).round(3)}"
  @a = (@a + @b).round(3)
  digital_02
end

def minus
  puts "Calculating result..."
  puts (@a - @b).round(3)
  @historic << "#{@a} - #{@b} = #{(@a - @b).round(3)}"
  @a = (@a - @b).round(3)
  digital_02
end

def multiply
  puts "Calculating result..."
  puts (@a * @b).round(3)
  @historic << "#{@a} x #{@b} = #{(@a * @b).round(3)}"
  @a = (@a * @b).round(3)
  digital_02
end

def divide
  puts "Calculating result..."
  puts (@a / @b).round(3)
  @historic << "#{@a} / #{@b} = #{(@a / @b).round(3)}"
  @a = (@a / @b).round(3)
  digital_02
end

def power
  puts "Calculating result..."
  puts (@a ** @a).round(3)
  @historic << "power of #{@a.round(3)} = #{(@a ** @b).round(3)}"
  @a = (@a ** @a).round(3)
  digital_02
end

def root
  puts "Calculating result..."
  a = @a
  root_result = Math.sqrt(a)
  puts root_result.round(3)
  @historic << "square root of #{@a.round(3)} = #{(root_result).round(3)}"
  @a = root_result.round(3)
  digital_02
end
def sin
  puts "Calculating result... sin Rad"
  a = @a
  sin_result = (Math.sin(a))
  puts sin_result
  @historic << "sin(#{@a.round(3)}) = #{sin_result.round(3)}"
  @a = sin_result
  digital_02
end
def cosine
  puts "Calculating result... cosine Rad"
  a = @a
  cosine_result = (Math.cos(a))
  puts cosine_result
  @historic << "cosin(#{@a.round(3)}) = #{cosine_result.round(3)}"
  @a = cosine_result
  digital_02
end
# OPERATOR REDIRECTER
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
    when 'p'
	  	power
    when 'r'
	  	root
    when 's'
      sin
    when 'o'
      cosine
    when 'c'
	  	reset
	  else
	  	puts 'This is an egg adder, not a scientific calculator!'
	  end
end

#INITIAL INTERFASE
def digital
  puts "Write your operation"
  puts "+|-|*|/|(p)ower|(r)oot|(s)in|c(o)sine|"
  digi_operation = gets.strip
  split_operation = digi_operation.split(/(\/|\+|\*|\-|p|r|s|o)|d+/)
  @a = split_operation.first.to_f
  @b = split_operation.last.to_f
  @x = split_operation[1]
  result
end
#SECUNDARY INTERFASE
def digital_02
  puts "Write your operation"
  puts "|+|-|*|/|(p)ower|(r)oot|(s)in|c(o)sine|"
  puts "|c| reset |h| history |m| memory save |u| memory use |e| exit"
  puts ""
  print @a
  digi_operation_02 = gets.strip
  split_operation = digi_operation_02.split(/(\/|\+|\*|\-|p|r|s|o|m|u)|d+/)
  if digi_operation_02.include?('u')
    @b = @memory.pop.to_f
  else
    @b = split_operation.last.to_f
  end
  @x = split_operation[1].to_s

  if digi_operation_02.include?('c')
    reset
  elsif digi_operation_02.include?('h')
    history
  elsif digi_operation_02.include?('m')
    @memory << @a
    puts "Saved number.. #{@memory[0]}" #MEMORY
    digital_02
  elsif digi_operation_02.include?('e')
    exit
  else
    result
  end
end
# MAIN MENU
def menu
  puts "---- DigitalEggAdder 3000 ----"
  puts "Press (1) to Calculate"
  puts "Press (2) for EggAdder"
  puts "Press (3) for exit"
  choice = gets.to_i
  case choice
  when 1
    digital
  when 2
    load 'calculator.rb'
  when 3
    exit
  else
    puts "Enter a valid choice!"
    menu
  end
end

# START
while true
  menu
end
