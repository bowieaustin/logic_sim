#!/usr/bin/env ruby

require_relative "gates"

class Net
    attr_reader :driver
    attr_reader :loads

    def initialize
        @loads = Array.new
    end

    def set_driver(gate)
        if gate.is_a?Gate
            @driver = gate
        end
    end

    def add_load(gate)
        if gate.is_a?Gate
            @loads.push(gate)
        end
    end

    def get_value
        @driver.evaluate
    end
end
