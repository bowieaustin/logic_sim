#!/usr/bin/env ruby

module DigitalLogic

    module Operators

        def self.And(inputs)
            val = inputs.pop
            return inputs.empty? ? val : (val && And(inputs))
        end

        def self.Nand(inputs)
            val = inputs.pop
            return inputs.empty? ? val : !(val && Nand(inputs))
        end

        def self.Or(inputs)
            val = inputs.pop
            return inputs.empty? ? val : (val || Or(inputs))
        end

        def self.Nor(inputs)
            val = inputs.pop
            return inputs.empty? ? val : !(val || Nor(inputs))
        end

        def self.Xor(inputs)
            val = inputs.pop
            if inputs.empty?
                return val
            end
            return_val = Xor(inputs)
            return (!val && return_val) || (val && !return_val)
        end

        def self.Xnor(inputs)
            val = inputs.pop
            if inputs.empty?
                return val
            end
            return_val = Xnor(inputs)
            return (val && return_val) || (!val && !return_val)
        end

        def self.Not(input)
            return !input
        end
    end
end
