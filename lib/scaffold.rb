class Scaffold
  attr_accessor :level

  def initialize
    @level = 0
  end

  def display
    LEVELS[@level]
  end

  def level_up
    @level += 1
  end

  private

  LEVELS = %i[bottom pillar top rope head arms body legs death].freeze

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