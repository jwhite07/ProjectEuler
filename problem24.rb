require 'benchmark'
def library
    range = (0..9).to_a
    range = range.permutation.to_a
    puts range[0..10].to_s
    return range[999999].join
end
def swaps
    range = (0..9).to_a
end

Benchmark.bm do |x|
    x.report { library }
    
end
library