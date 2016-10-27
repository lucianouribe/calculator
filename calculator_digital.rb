@historic = []
@memory = []


@a = 0
@b = 0
@x = ""

def history
  puts "--- Our great numeric history ---\n"
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
  @historic << "#{@a} ** #{@a} = #{(@a ** @b).round(3)}"
  @a = (@a ** @a).round(3)
  digital_02
end

def root
  puts "Calculating result..."
  a = @a
  root_result = Math.sqrt(a)
  puts root_result.round(3)
  @historic << "#{@a} r = #{(root_result).round(3)}"
  @a = root_result.round(3)
  digital_02
end
def sin
  puts "Calculating result... sin Rad"
  a = @a
  sin_result = (Math.sin(a))
  puts sin_result
  digital_02
end
def cosine
  puts "Calculating result... cosine Rad"
  a = @a
  cosine_result = (Math.cos(a))
  puts cosine_result
  digital_02
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
def digital_02
  puts "Write your operation"
  puts "|+|-|*|/|(p)ower|(r)oot|(s)in|c(o)sine|"
  puts "|c| reset |h| history |m| memory save |u| memory use"
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
    puts "Saved number.. #{@memory}"
    digital_02
  else
    result
  end
end
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


while true
  menu
end
