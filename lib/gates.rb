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
        end
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

class Or
    include Gate
    def eval
        if inputs.size < 2
            raise "0 or 1 inputs"
        end
        inputs.each do |input|
            if input == 1
                return 1
            end
        end
        return 0
    end
end

class Nor
    include Gate
    def eval
        if inputs.size < 2
            raise "0 or 1 inputs"
        end
        inputs.each do |input|
            if input == 1
                return 0
            end
        end
        return 1
    end
end

class Xor
    include Gate 
    def eval
        if inputs.size < 2
            raise "0 or 1 inputs"
        end
        num_high = 0
        num_low = 0
        inputs.each do |input|
            if input == 0
                num_low = num_low+1
            else
                num_high = num_high+1
            end
        end
        if num_high == num_low
            return 1
        end
        return 0
    end
end

class Xnor
    include Gate
    def eval
        if inputs.size < 2
            raise "0 or 1 inputs"
        end
        num_high = 0
        num_low = 0
        inputs.each do |input|
            if input == 0
                num_low = num_low+1
            else
                num_high = num_high+1
            end
        end
        if num_high == num_low
            return 0
        end
        return 1
    end
end

class Not
    include Gate
    def eval
        if inputs.size > 1 || inputs.size < 0
            raise "#{inputs.size} inputs"
        end
        if inputs[0] == 0
            return 1
        end
        return 0
    end
end