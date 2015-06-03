#!/usr/bin/env ruby

module Gate
    attr_accessor :inputs
    attr_accessor :output

    def eval
        raise "Eval not implemented!"
    end
    
    def raise(error_message)
        super self.class.name + ": " + error_message
    end
end

class And
    include Gate
    def eval
        if inputs.size < 2
            raise "0 or 1 inputs"
        inputs.each do |input|
            if input == 0
                return 0
            end
        end
        return 1
    end
end

class Nand
    include Gate
    def eval
        if inputs.size < 2
            raise "0 or 1 inputs"
        end
        inputs.each do |input|
            if input == 0
                return 1
            end
        end
        return 0
    end
end


