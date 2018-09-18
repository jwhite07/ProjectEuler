require 'prime'
def amicable_pair(n,m)
    return false if m <= 1 || n <= 1
    return false if m == n
    if sum_proper_divisors(m) == n && sum_proper_divisors(n) == m
        return true
    else
        return false
    end
end
def sum_proper_divisors(n)
    result = 0
    for i in 2..(Math.sqrt(n).floor) do 
        if n % i == 0
            if i == n / i
                result += i
            else
                result += (i + n / i)
            end
        end
    end
    return result + 1
end
# puts amicable_pair(284, 220)
# puts amicable_pair(25, 21)

# puts sum_proper_divisors(10)
# puts sum_proper_divisors(36)
# puts sum_proper_divisors(220)
# puts sum_proper_divisors(284)

def find_amicables(n)
    pairs = []
    sum = 0
    for i in 0..n do 
        next if pairs.include? i
        d = sum_proper_divisors(i)
        next if d == i
        p = sum_proper_divisors(d)
        if p == i 
            pairs << d
            pairs << i
            sum += d + i
        end
    end
    return sum
end
puts find_amicables(10000)