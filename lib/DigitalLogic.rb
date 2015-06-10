#!/usr/bin/env ruby

module DigitalLogic

    module Operators

        def And(inputs)
            val = inputs.pop
            return inputs.empty? ? val : (val && And(inputs))
        end

        def Nand(inputs)
            val = inputs.pop
            return inputs.empty? ? val : !(val && Nand(inputs))
        end

        def Or(inputs)
            val = inputs.pop
            return inputs.empty? ? val : (val || Or(inputs))
        end

        def Nor(inputs)
            val = inputs.pop
            return inputs.empty? ? val : !(val || Nor(inputs))
        end

        def Xor(inputs)
            val = inputs.pop
            if inputs.empty?
                return val
            end
            return_val = Xor(inputs)
            return (!val && return_val) || (val && !return_val)
        end

        def Xnor(inputs)
            val = inputs.pop
            if inputs.empty?
                return val
            end
            return_val = Xnor(inputs)
            return (val && return_val) || (!val && !return_val)
        end

        def Not(input)
            return !input
        end
    end

    class Circuit
        attr_reader :circuit
        
        def initialize
            @circuit = Hash.new
        end

        def add_input(name, input)
            @circuit.fetch(name).fetch(:inputs).push input
        end

        def add_gate(name, type)
            @circuit[name] = { :type => type, :inputs => Array.new}
        end
    end
end