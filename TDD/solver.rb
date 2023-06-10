class Solver
  def factorial(n)
    raise ArgumentError, "Factorial input must be a non-negative integer" if n.negative?
    return 1 if n.zero?
    result = 1
    while (n > 1)
      result *= n
      n -= 1
    end
    return result
  end
end
