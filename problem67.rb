problem = [
    [75],
    [95, 64],
    [17, 47, 82],
    [18, 35, 87, 10],
    [20,  4, 82, 47, 65],
    [19,  1, 23, 75,  3, 34],
    [88,  2, 77, 73,  7, 63, 67],
    [99, 65,  4, 28,  6, 16, 70, 92],
    [41, 41, 26, 56, 83, 40, 80, 70, 33],
    [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
    [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
    [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
    [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
    [63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
    [ 4, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60,  4, 23]
]

check = [
    [3],
    [7, 4],
    [2, 4, 6],
    [8, 5, 9, 3]
]

# def vertices(arr)
#     vertices = []
#     arr.each_with_index do |r, y|
#         r.each_with_index do |n, x|
#             find_descendants(arr,x,y).each do |desc|
#                 vertices << arr[desc[1]][desc[0]]
#             end
#         end
#     end
# end

# def find_descendants(data,x,y)
    
#     if y == data.length - 1
#         ret = []
#     else
#         ret = [[x+1,y],[x+1,y+1]]
#     end
# end

# def djikstra(graph, source)
#     q = []
#     graph.each do |v|
        
# end
def read_file_to_arr(path)
    ret = []
    File.open(path, "r") do |f|
        f.each_line do |line|
            ret << line.split(" ").map { |s| s.to_i}
        end
    end
    return ret
end

def find_max(arr)
    last_row = arr.length - 1
    new_row = []
    return arr if arr.length == 1
    arr[last_row - 1].each_with_index do |row, i|
        v = 0
        # puts(" Last Row: #{last_row}, i: #{i}, num i: #{arr[last_row][i]}, num i + 1: #{arr[last_row][i+1]}")
        if arr[last_row][i] > arr[last_row][i+1]
            v = arr[last_row][i] + row
        else
            v = arr[last_row][i+1] + row
        end
        new_row << v
        
        
    end 
    arr.slice!(-2, 2)
    arr << new_row
    return find_max(arr)

end
problem = read_file_to_arr("p067_triangle.txt")
puts(find_max(problem))