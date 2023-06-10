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

  def reverse(word)
    i = word.length - 1
    reverse_word = ''
    while i >= 0
      reverse_word += word[i]
      i -= 1
    end
    reverse_word
  end

  def fizzbuzz(n)
    if n % 3 == 0 && n % 5 == 0
      return 'fizzbuzz'
    elsif n % 3 == 0
      return 'fizz'
    elsif n % 5 == 0
      return 'buzz'
    else 
      return n.to_s
    end
  end
end
