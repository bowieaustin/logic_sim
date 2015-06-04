#!/usr/bin/env ruby

class Gate
    attr_reader :inputs
    attr_reader :outputs
    
    def initialize
        @inputs = Array.new
    end

    def add_input(input)
        @inputs.push input
        if input.respond_to? :add_output
            input.add_output self
        end
    end

    def inputs=(inputs)
        @inputs = Array.new
        inputs.each do |input|
            @inputs.push input
            if input.respond_to? :add_output
                input.add_output self
            end
        end
    end

    def add_output(gate)
        @outputs.push(gate)
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
            if input.respond_to?("evaluate")
                input = input.evaluate
            end
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
            if input.respond_to?("evaluate")
                input = input.evaluate
            end
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
            if input.respond_to?("evaluate")
                input = input.evaluate
            end
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
            if input.respond_to?("evaluate")
                input = input.evaluate
            end
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
        current_val = -1
        inputs.each do |input|
            if input.respond_to?("evaluate")
                input = input.evaluate
            end
            if current_val == -1
                current_val = input
                next
            end
            if input == current_val
                current_val = 0
            else
                current_val = 1
            end
        end
        return current_val
    end
end

class Xnor<Gate

    def evaluate
        if inputs.size < 2
            raise "0 or 1 inputs"
        end
        current_val = -1
        inputs.each do |input|
            if input.respond_to?("evaluate")
                input = input.evaluate
            end
            if current_val == -1
                current_val = input
                next
            end
            if input == current_val
                current_val = 0
            else
                current_val = 1
            end
        end
        if current_val == 1
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
        if inputs[0].respond_to?("evaluate")
           input[0] = input.evaluate
        end
        if inputs[0] == 0
            return 1
        end
        return 0
    end
end
