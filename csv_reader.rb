require 'csv'
class Reader
    def initialize(file_path=false)
        unless file_path
            create_file
            file_path = 'file.csv'
        end
        @file_path = file_path

        @csv_array = get_from_file
        nil
    end

    def csv_array
        @csv_array
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
        @csv_array.map { |i| i.last}.min
    end

    def find_max
        @csv_array.map { |i| i.last }.max
    end

    def find_average
        @csv_array.map { |i| i.last}.reduce(:+) / @csv_array.size
    end

    private

    def get_from_file
        array = []
        CSV.foreach(@file_path) do |row|
            array << [row.first, row.last.gsub(',', '.').gsub(' ', '').to_f]
        end
        array.uniq {|u| u.first}.sort { |a,b|
             (Date.parse a.first) <=> (Date.parse b.first)}
    end
end
