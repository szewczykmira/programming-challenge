# there are n levels: debug, info, warn, error

# logger class, as parameter accepts only string or symbol
class Logger

    class LevelError < ArgumentError
        def initialize
            super("Accepts only " + LEVELS.to_s)
        end
    end

    LEVELS = [:debug, :info, :warning, :error]
    
    def initialize(level, name="logger")
        raise LevelError unless LEVELS.include? level
        @level = level
        @name = name
    end

    def debug(msg)
        display(msg, :debug)
    end

    def info(msg)
        display(msg, :info)
    end

    def warning(msg)
        display(msg, :warning)
    end

    def error(msg)
        display(msg, :error)
    end

    private
    def display(msg, level)
        return unless LEVELS.index(level) >= LEVELS.index(@level)
        puts "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")} #{@name} [#{level}]: #{msg}"
    end
end
