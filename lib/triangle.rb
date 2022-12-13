class Triangle
  
  attr_reader :arg1, :arg2, :arg3

  def initialize(arg1, arg2, arg3)
    @arg1 = arg1
    @arg2 = arg2
    @arg3 = arg3
  end

  def kind
    validate_triangle
    if arg1 == arg2 && arg2 == arg3
      :equilateral
    elsif arg1 == arg2 || arg1 == arg3 || arg2 == arg3
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    raise TriangleError unless all_args_positive? && side_sums_check_out?
  end

  def all_args_positive?
    arg1 > 0 && arg2 > 0 && arg3 > 0
    # alt solution
    # [arg1, arg2, arg3].all?(&:positive?)
  end

  def side_sums_check_out?
    arg1 + arg2 > arg3 && arg1 + arg3 > arg2 && arg2 + arg3 > arg1
  end

  class TriangleError < StandardError
  end

end

triangle = Triangle.new(1, 1, 1)
triangle.kind

