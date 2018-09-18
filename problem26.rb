require 'benchmark'
d = (1..10).to_a
@remainders = []
def recurring_cycle_length(n)
    r = 1 % n
    c = calculate_cycle(r, n, [])
    puts "cycle: #{c}"
    return c.length
end
def calculate_cycle(r,n,c) 
    puts "previous remainder: #{r}, denominator: #{n}, cycle: #{c.to_s}"
    num = r * 10
    
    r = num % n
    q = num / n
    puts "remainder: #{r} quotient: #{q}"
    return c[c.index(r)..-1] if r > 0 && c.include?(r)
    # return c if c.length >= n
    c << r
    return calculate_cycle(r,n,c)
end

def find_longest_cycle(n)
    arr = (1..n).to_a.reverse
    # puts arr
    longest = 0.to_i
    arr.each do |n|
        # puts "#{longest} is Longest. Checking #{n} "
        return longest if longest > n
        r = recurring_cycle_length(n) 
        longest = (r > longest) ? r : longest
    end
    return longest
end
def find_longest_cycle_no_short(n)
    arr = (1..n).to_a.reverse
    # puts arr
    longest = 0.to_i
    arr.each do |n|
        #  puts "#{longest} is Longest. Checking #{n} "
        # return longest if longest > n
        r = recurring_cycle_length(n) 
        longest = (r > longest) ? r : longest
    end
    return longest
end

# Benchmark.bm do |x|
#     x.report { puts find_longest_cycle(100000) }
#     x.report { puts find_longest_cycle_no_short(100000) }
# end

puts recurring_cycle_length(983)

# 1/7 = 0 % 1
# 10/7 = 1 % 3
# 30/7 = 4 % 2
# 20/7 = 2 % 6
# 60/7 = 8 % 4
# 40/7 = 5 % 5
# 50/7 = 7 % 1
# 10/7 = 1 5 3
