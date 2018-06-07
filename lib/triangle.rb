class Triangle
  attr_accessor :length_1, :length_2, :length_3, :equilateral, :scalene, :isosceles

  def initialize(length_1, length_2,length_3)
    @length_1 = length_1;
    @length_2 = length_2;
    @length_3 = length_3;
  end

  def kind

    a_and_b = (@length_1 == @length_2) ? true : false
    a_and_c = (@length_1 == @length_3)
    b_and_c = (@length_2 == @length_3)

    triangle_inequality? = @length_1 + @length_2 > @length_3 ||
                          @length_1 + @length_3 > @length_2 ||
                          @length_2 + @length_3 > @length_1;

    if @length_1 > 0 && @length_2 > 0 && @length_3 > 0 && triangle_inequality?
      equilateral = a_and_b? && b_and_c?;
      scalene = !a_and_b? && !a_and_c? && !b_and_c?;
      isosceles = (a_and_b? && !a_and_c?) ||
                  (a_and_c? && !a_and_b?) ||
                  (b_and_c? && !a_and_b?);
      if equilateral
        @equilateral
      elsif scalene
        @scalene
      elsif isosceles
        @isosceles
      else
        begin
          raise TriangleError
        rescue TriangleError => error
          puts error.message;
        end
      end
    end
  end

  class TriangleError < StandardError
    def message
      "The given lengths are now a valid triangle."
    end
  end

end
