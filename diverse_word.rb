class DiverseWord
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def calculate(s, v, k)
    s += k
    v -= 1
    [s, v]
  end

  def solution
    s = ''
    count = 0
    total = a + b + c

    hash = { 'a' => a, 'b' => b, 'c' => c }
    hash_sort = hash.sort_by { |_, v| -v }

    k_max, v_max = hash_sort.first
    k_mid, v_mid = hash_sort[1]
    k_min, v_min = hash_sort.last

    for _ in 0...total do
      if count < 2 && !v_max.zero?
        s, v_max = calculate(s, v_max, k_max)
        count += 1
      elsif !v_mid.zero?
        s, v_mid = calculate(s, v_mid, k_mid)
        count = 0
      elsif !v_min.zero?
        s, v_min = calculate(s, v_min, k_min)
        count = 0
      else
        break
      end
    end
    s
  end
end
