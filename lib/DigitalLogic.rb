#!/usr/bin/env ruby

require_relative "logic_gates"
require_relative "logic_circuit"
require_relative "logic_parser"
require_relative "logic_analyzer"

module DigitalLogic
    def self.run(file_name)
        parsed_gates = DigitalLogic::Parser.parse(file_name)
        cir = DigitalLogic::Circuit.new
        output = nil
        parsed_gates.each do |gate|
            type = gate[0]
            name = gate[1]
            inputs = gate[2]
            if type.equal?nil
                if !cir.circuit.has_key?name
                    puts "Gate #{name} missing gate type"
                    return 1
                else
                    inputs.map! do |input|
                        if input.eql?"1"
                            true
                        elsif input.eql?"0"
                            false
                        else
                            input
                        end
                    end
                    inputs.each do |input|
                        cir.add_input(name, input)
                    end
                end
            elsif type.eql?"output"
                output = name
                next
            else
                if cir.circuit.has_key?name
                    puts "Warning: overwriting #{name}. To avoid, only declare gate type once per gate."
                end
                cir.add_gate(name, type.to_sym)
                inputs.map! do |input|
                    if input.eql?"1"
                        true
                    elsif input.eql?"0"
                        false
                    else
                        input
                    end
                end
                inputs.each do |input|
                    cir.add_input(name, input)
                end
            end
        end
        DigitalLogic::Analysis.analyze(cir, output)
    end
end
