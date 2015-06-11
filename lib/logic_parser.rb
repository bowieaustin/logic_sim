#!/usr/bin/env ruby

module DigitalLogic
    module Parser
        def self.parse(file_name)
            file = File.new(file_name)
            buf = file.read(1024)
            instructions = buf.split(%r{\.})
            puts instructions.to_s
            parsed_gates = Array.new
            instructions.each do |instruction|
                puts instructions.length
                res = parse_instruction(instruction)
                if !res.equal?nil
                    parsed_gates.push res
                end
            end
            puts parsed_gates.to_s
            return parsed_gates
        end

        def self.parse_instruction(instruction)
            type = nil
            name = nil
            words = instruction.split(%r{ |,|\.|\n})
            words.delete ""
            puts words.to_s
            if words.size < 2
                return
            end
            if DigitalLogic::Operators.instance_methods.include?words[0].to_sym
                type = words.delete_at 0
            end
            ind = words.index("takes")
            if ind.equal? nil
                #no_inputs
            end
            name = ""
            ugly_iterator = 0
            words.each do |word|
                name = name + words[ugly_iterator]
                ugly_iterator += 1
                if ugly_iterator == ind
                    break
                else 
                    name = name + " "
                end
            end
            len = words.size-1
            ind += 1
            inputs = Array.new 
            (ind..len).to_a.each do |index|
                inputs.push words[index]
            end
            return [type, name, inputs]
        end
    end
end
