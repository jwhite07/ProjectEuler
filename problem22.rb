def read_file_to_arr(path)
    ret = []
    File.open(path, "r") do |f|
        f.each_line do |line|

            ret = line.split(",")
        end
    end
    return ret
end
def total_name_scores(file)
    start = Time.now
    names = read_file_to_arr(file)
    names.sort!
    total = 0
    names.each_with_index do |n, i|
        total += alpha_score(n) * (i+1)
    end
    finish = Time.now
    puts finish - start
    return total
    
end
def scores
    n = 1..26
    a = "A".."Z"
    return a.zip(n).to_h
end

def alpha_score(n)
    return scores[n] if n.length == 1
    return scores[n.slice!(0)] + alpha_score(n)
end



puts total_name_scores("p022_names.txt")