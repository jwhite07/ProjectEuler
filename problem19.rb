sundays = 0
class Year
    def initialize(start_day, num)
        @start_day = start_day
        @year = num
        @first_sundays = 0
        @next_start = 0
        @months = init_months
        
        
    end 
    def leap
        if @year % 400 == 0
            return true
        elsif @year % 100 == 0
            return false
        elsif @year % 4 == 0
            return true
        else 
            return false
        end
    end
    def month_lengths
        if leap
            return [31,29,31,30,31,30,31,31,30,31,30,31]
        else
            [31,28,31,30,31,30,31,31,30,31,30,31]
        end
    end
    def init_months 
        next_start = @start_day
        month_lengths.each do |m|
            @first_sundays += 1 if next_start == 0
            cur = Month.new(m,next_start)
            next_start = cur.next_start            
        end
        @next_start = next_start
    end
    def next_start
        @next_start
    end
    def first_sundays
        @first_sundays
    end
end

class Month
    def initialize(days, start)
        @days = days
        @start_day = start
    end
    def next_start
        (@start_day + @days) % 7
    end

    
end
start_year = 1901

start_day = 2
first_sundays = 0
100.times do 
    yr = Year.new(start_day, start_year)
    start_year += 1
    start_day = yr.next_start
    first_sundays += yr.first_sundays
    puts "Next year: #{start_year} starts on: #{start_day}, there have been #{first_sundays} first day sunday months."
end
