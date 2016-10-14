# there are n levels: debug, info, warn, error
LEVELS = [:debug, :info, :warning, :error]

# logger class, as parameter accepts only string or symbol
class Logger
    def initialize(level, name="logger")
        unless LEVELS.include? level
            raise ArgumentError.new("Accepts only debug, info, warning, error")
        end
        @level = level
        @name = name
    end

    def debug(msg)
        if @level == :debug
            display(msg)
        end
    end

    def info(msg)
        if [:info, :debug].include? @level
            display(msg)
        end
    end

    def warning(msg)
        unless @level == :error
            display(msg)
        end
    end

    def error(msg)
        display(msg)
    end

    private
    def display(msg)
        puts "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")} #{@name} [#{@level}]: #{msg}"
    end
end
