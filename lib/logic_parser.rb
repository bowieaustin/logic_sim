#!/usr/bin/env ruby

module DigitalLogic
    module Parser
        def parse(file_name)
            file = File.new(file_name)
            buf = file.read(1024)
            instructions = buf.split(%r{.})
            instructions.each do |instruction|
                #parse instructions hurr
            end
        end

        def parse_instruction(instruction)
            type = nil
            name = nil
            words = instruction.split(%r{ |,|\.})
            words.delete ""
            if DigitalLogic::Operators.instance_methods.includes?words[0].to_sym
                type = words.delete 0
            end
            ind = words.index("take")
            if ind.equal? nil
                #no_inputs
            end
            name = ""
            ugly_iterator = 0
            words.each do |word|
                name + words[ugly_iterator]
                ugly_iterator += 1
                if ugly_iterator == ind
                    break
                end
            end
            len = words.size-1
            inputs = Array.new
            (ind..len).to_a.each do |index|
                inputs.push words[index]
            end
            return type, name, inputs
        end
    end
end
