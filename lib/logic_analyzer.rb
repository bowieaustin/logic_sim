#!/usr/bin/env ruby
require "pry"
module DigitalLogic
    module Analysis

        def self.analyze(circuit, output)
            evaluate_list = circuit.circuit.keys
            inputs = Hash.new
            final_gate = output
            (0..1000).to_a.each do
                evaluate_list.each do |gate|
                    input_names = circuit.circuit.fetch(gate).fetch(:inputs)
                    list_to_evaluate = Array.new
                    can_be_evaluated = true
                    input_names.each do |name|
                        if name.equal?(true) || name.equal?(false)
                            list_to_evaluate.push name
                            next
                        elsif inputs.fetch(name,nil).equal?nil
                            can_be_evaluated = false
                        else 
                            list_to_evaluate.push inputs.fetch(name)
                        end
                    end
                    if can_be_evaluated
                        output = DigitalLogic::Operators.send(circuit.circuit.fetch(gate).fetch(:type), list_to_evaluate)
                        inputs[gate] = output
                    end
                end
                if !inputs.fetch(final_gate,nil).equal?nil
                    puts inputs.to_s
                    break
                end
            end
        end
    end
end
