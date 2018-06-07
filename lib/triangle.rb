class Triangle
  attr_accessor :length_1, :length_2, :length_3, :equilateral, :scalene, :isosceles

  def initialize(length_1, length_2,length_3)
    @length_1 = length_1;
    @length_2 = length_2;
    @length_3 = length_3;
  end

  def kind
    if @length_1 > 0 && @length_2 > 0 && @length_3 > 0
      equilateral = @length_1 == @length_2 && @length_2 == @length_3;
      scalene = @length_1 != @length_2 && @length_2 != @length_3 && @length_1 != @length_3;
      isosceles = (@length_1 == @length_2 && @length_1 != @length_3) ||
                  (@length_1 == @length_3 && @length_1 != @length_2) ||
                  (@length_2 == @length_3 && @length_1 != @length_2);
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
