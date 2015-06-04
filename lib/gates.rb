#!/usr/bin/env ruby

class Gate
    attr_accessor :inputs
    attr_accessor :output
    
    def initialize
        @inputs = Array.new
    end

    def evaluate
        raise "Eval not implemented!"
    end
    
    def raise(error_message)
        super "#{self.class.name}: #{error_message}" 
    end
end

class And<Gate

    def evaluate
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

class Nand<Gate

    def evaluate
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

class Or<Gate

    def evaluate
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

class Nor<Gate

    def evaluate
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

class Xor<Gate

    def evaluate
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

class Xnor<Gate

    def evaluate
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

class Not<Gate

    def evaluate
        if inputs.size != 1
            raise "#{inputs.size} inputs"
        end
        if inputs[0] == 0
            return 1
        end
        return 0
    end
end
