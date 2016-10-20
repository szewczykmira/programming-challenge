require 'csv'
class Reader
    def initialize(file_path=false)
        unless file_path
            create_file
            file_path = 'file.csv'
        end
        @file_path = file_path

        @csv_array = get_from_file.uniq {|u| u.first}
        nil
    end

    def create_file
        rand = Random.new
        today = Date.today
        CSV.open('file.csv', 'wb') do |csv|
            (0..100).each do |day|
                csv << [(today + day).to_s, rand.rand(4000.0)]
            end
        end
    end

    def find_min
        @csv_array.map { |i| i.last.to_f }.min
    end

    def find_max
        @csv_array.map { |i| i.last.to_f }.max
    end

    def find_average
        @csv_array.map { |i| i.last.to_f}.reduce(:+) / @csv_array.size
    end

    private

    def get_from_file
        arr_of_dates = CSV.read(@file_path)
    end
end
