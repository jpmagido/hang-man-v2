class Scaffold
  attr_accessor :level

  def initialize
    @level = 0
  end

  def display
    #puts ''
    #puts ''
    #self.send(LEVELS[@level])
    #puts "il vous reste #{8 - @level} essais"
  end
=begin
  def death?
    (8 - @leve#l).positive?
  end

  def level_up
    @level += 1
  end

  private

  LEVELS = {
    0 => :bottom,
    1 => :pillar,
    2 => :top,
    3 => :rope,
    4 => :head,
    5 => :arms,
    6 => :body,
    7 => :legs,
    8 => :death
  }.freeze
=end
  def bottom
    puts ' _______________'
  end

  def top
    puts ' ---------'
    8.times { puts '|' }
    bottom
  end

  def pillar
    8.times { puts '|' }
    bottom
  end

  def rope
    puts ' ---------'
    puts '|        |'
    8.times { puts '|' }
    bottom
  end

  def head
    puts ' ---------'
    puts '|        |'
    puts '|      ($_$)'
    7.times { puts '|' }
    bottom
  end

  def arms
    puts ' ---------'
    puts '|        |'
    puts '|      (o_o)'
    puts '|   ____| |____'
    6.times { puts '|' }
    bottom
  end

  def body
    puts ' ---------'
    puts '|        |'
    puts '|      (O_o)'
    puts '|   ____| |____'
    puts '|      |   | '
    puts '|      |___| '
    4.times { puts '|' }
    bottom
  end

  def legs
    puts ' ---------'
    puts '|        |'
    puts '|      (O_O)'
    puts '|   ____| |____'
    puts '|      |   | '
    puts '|      |___| '
    puts '|      |   | '
    puts '|     _|   |_ '
    2.times { puts '|' }
    bottom
  end

  def death
    puts ' ---------'
    puts '|        |'
    puts '|      (*_*)'
    puts '|   ____| |____'
    puts '|      |   | '
    puts '|      |___| '
    puts '|      |   | '
    puts '|     _|   |_ '
    2.times { puts '|' }
    bottom
  end
end