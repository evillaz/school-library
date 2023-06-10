class Solver
  def factorial(num)
    raise ArgumentError, 'Factorial input must be a non-negative integer' if num.negative?
    return 1 if num.zero?

    result = 1
    while num > 1
      result *= num
      num -= 1
    end
    result
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

  def fizzbuzz(num)
    if (num % 3).zero? && (num % 5).zero?
      'fizzbuzz'
    elsif (num % 3).zero?
      'fizz'
    elsif (num % 5).zero?
      'buzz'
    else
      num.to_s
    end
  end
end
