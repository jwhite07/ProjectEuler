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
def is_abundant(n)
    sum_proper_divisors(n) > n ? true : false
end
@list = []
@max = 28123
start = Time.now

28123.times do |n|
    @list << n if is_abundant(n)
end
finish = Time.now
# puts finish - start

@numbers = (0..@max).to_a

puts @numbers[0..25]
# @start = Time.now

# 10000.times do 
#     @numbers[rand(28123)+1] = 0
# end
# puts @numbers.length
# puts Time.now - start

def sum_of_abundants(n)
    return false if n < 24 
    @list.each do |i|
        return false if i > n / 2
        return true if @list.include?(n - i)  
    end
    return false
end
def sum_non_abundant
    total = 0
    # for n in 1..22000 do
    #     puts "Currently at #{n}, total #{total}" if n % 1000 == 0
    #     if !sum_of_abundants(n)
    #         total += n
            

    #     end
    # end

    return total
end
def remove_sums(a,n) #a = abundant numbers, n = numbers
    return n if a.length == 0
    #  puts "abundants to check: #{a.length}, sum remaining: #{n.sum}, max: #{@max}, elapsed: #{Time.now - @start}" #if a.length % 100 == 0
    i = a[0]
    a.each_with_index do |j, k|
        if i + j > @max
            a.slice!(k..a.length)
            break
        end
        break if i+j == 12
        break if i+j == 1
        n[i+j] = 0
        
    end
    @max = n.max
    a.shift
    return remove_sums(a,n)

end

@start = Time.now
 n =  remove_sums(@list, @numbers)
n.delete(0)

puts n.sum

finish = Time.now
 puts finish - @start
# puts sum_non_abundant