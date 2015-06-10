#!/usr/bin/env ruby

module DigitalLogic
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