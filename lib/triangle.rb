require "pry"

class Triangle
  attr_accessor :length_1, :length_2, :length_3

  def initialize(length_1, length_2,length_3)
    @length_1 = length_1;
    @length_2 = length_2;
    @length_3 = length_3;
  end

  def kind
    puts "first check is #{@length_1} and #{@length_2} and #{@length_3}"
    a_and_b = @length_1 == @length_2
    a_and_c = @length_1 == @length_3
    b_and_c = @length_2 == @length_3
    puts "second check is #{a_and_b} and #{a_and_c} and #{b_and_c}"

    triangle_inequality = (@length_1 + @length_2) > @length_3 ||
                          @length_1 + @length_3 > @length_2 ||
                          @length_2 + @length_3 > @length_1;

    puts "third check is #{triangle_inequality}"
    check_length_validity = @length_1 <= 0 || @length_2 <= 0 || @length_3 <= 0;
    puts "fourth check is #{check_length_validity}"

    if (check_length_validity) || !triangle_inequality
      raise TriangleError
    else
      if a_and_b && b_and_c
        :equilateral
      elsif !a_and_b && !a_and_c && !b_and_c
        :scalene
      elsif (a_and_b && !a_and_c) ||
            (a_and_c && !a_and_b) ||
            (b_and_c && !a_and_b)
        :isosceles
      end
    end
  end

  class TriangleError < StandardError
    def message
      "The given lengths are now a valid triangle."
    end
  end

end
