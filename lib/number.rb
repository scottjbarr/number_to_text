class Number

  ZERO = { 0 => "zero" }

  UNITS = {
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
  }

  TEENS = {
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
  }

  TENS = {
    10 => "ten",
    20 => "twenty",
    30 => "thirty",
    40 => "fourty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety",
  }

  GROUPS = ["hundred", "thousand", "million", "billion", "trillion"]
  
  # numbers that need qualification. Eg 123,000 is "123 thousand", where
  # thousand is the qualifier
  QUALIFIERS = ["trillion", "billion", "million", "thousand"]

  BASIC = UNITS.merge(TEENS).merge(TENS).merge(ZERO)

  SEPARATOR = "-"

  def initialize(i)
    @i = i
    @s = i.to_s
  end

  def to_i
    @i
  end

  def to_s
    @s
  end

  def to_word
    return "zero" if self.zero?
    return BASIC[@i] if BASIC.include?(@i)

    parts = []
    
    get_groups.each_pair do |name, value|
      part = number_as_text(name, value).to_s

      # if part.to_s.size > 0 && QUALIFIERS.include?(name.to_s)
      #   part = part.concat("-" + QUALIFIERS[QUALIFIERS.index(name.to_s)])
      # end
      
      parts << part
    end

    parts_to_words(parts)
  end

  #
  # The parts array contains trillions, billions, millions, thousands, and 
  # hundreds. This method joins them altogether into a spoken words.
  #
  # Eg. 1001 is represented as ["", "", "", "one", "one"]
  #
  def parts_to_words(parts)
    word = ""
    
    parts.each_with_index do |part, i|
      if part.size > 0
        
        if i < 4
          word = word.concat(part + "-" + QUALIFIERS[i])
        else
          if word.size > 0
            word = word.concat("-and-" + part)
          else
            word = word.concat(part)
          end
        end
        
      end
    end
    
    word
  end
  
  def zero?
    @i == 0
  end
  
  def hundreds
    integer_in_group(0)
  end

  def thousands
    integer_in_group(1)
  end

  def millions
    integer_in_group(2)
  end

  def billions
    integer_in_group(3)
  end

  def trillions
    integer_in_group(4)
  end

  def integer_at(idx)
    return nil if @s.length < idx
    @s[@s.length-idx].chr.to_i
  end

  #
  # Return the integer value of a 'group' from a number.
  # Eg. for 123,456,789 
  #     789 is group 0, (hundreds, tens and units)
  #     456 is group 1 (thousands)
  #     123 is group 1 (millions)
  #
  def integer_in_group(group)
    @s.reverse[(group) * 3, 3].reverse.to_i
  rescue
    nil
  end

  def get_groups
    return { :trillion => self.trillions,
      :billion => self.billions,
      :million => self.millions,
      :thousand => self.thousands,
      :hundred => self.hundreds }
  end

  # name is the unit eg hundred, thousand
  # i is a number between 0 and 999 inclusive
  def number_as_text(name, i)
    
    # puts "number_as_text" + [name, i].inspect
    return if i.nil? or i == 0
    
    # reverse the number
    value = i.to_s.reverse
    
    hundreds = "#{UNITS[value[2].chr.to_i]}-hundred" if i > 99
    tens = "#{TENS[value[1].chr.to_i * 10]}" if i > 9
    units = "#{UNITS[value[0].chr.to_i]}" unless value[0].chr == "0"
    teens = "#{TEENS[(i%100)]}" if TEENS.key?(i % 100)
    concat_parts(hundreds, tens, units, teens, i)
  end

  def concat_parts(hundreds, tens, units, teens, i)
      
    small = nil
    large = nil
    
    if teens
      small = TEENS[(i % 100)]
    elsif tens.to_s.size > 0 && units.to_s.size > 0
      small = "#{tens}-#{units}"
    elsif tens.to_s.size > 0
      small = "#{tens}"
    elsif units.to_s.size > 0
      small = "#{units}"
    end
  
    if hundreds
      large = "#{hundreds}-hundred"
    end
    
    if large.to_s.size > 0 && small.to_s.size > 0
      return "#{hundreds}-and-#{small}"
    elsif large.to_s.size > 0
      return "#{hundreds}"
    end
    
    return small
    
  end
  
end
