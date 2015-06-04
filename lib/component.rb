#!/usr/bin/env ruby

require_relative "gates"
require_relative "net"

class Component
    
    attr_accessor :inputs
    attr_accessor :nets
    attr_accessor :gates
    attr_accessor :outputs
end

class Adder<Component
    
    def initialize(num_bits)
        num_bits.times do |x|
            gate = l
