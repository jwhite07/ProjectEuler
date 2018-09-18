# start = 8

# def prime_factors(x)
#     f = []
#     while x % 2 == 0
#         # puts "#{x} is divisible by 2"    
#         f << 2
#         x = x / 2
        
#     end
#     3.step(Math.sqrt(x),2) do |i|
#         # puts "checking divisibility of #{x} by #{i}"
#         while  x % i == 0
#             # puts "#{x} is divisible by #{i}"
#             f << i
#             x = x / i
#         end
#         break if i > Math.sqrt(x) 
#     end
#     if x > 2
#         # puts "#{x} is a prime"
#         f << x
#     end
#     return f
# end
# def factorial(n, f)
#     return f if n == 0 
    
#     f.push(*prime_factors(n))
#     return factorial(n - 1, f)
# end
# powers = {}
# powers.default = 0
# factorial(start, []).each do |i|
#     powers[i] += 1
# end

# tens = []

# powers.each do |prime,power|
# end
# puts powers
def factorial(n)
    return n if n == 1 
    
    return n * factorial(n - 1)
end
def sum_digits(n)
    return n if n < 10
    return n % 10 + sum_digits(n/10)
end
puts sum_digits(factorial(100))