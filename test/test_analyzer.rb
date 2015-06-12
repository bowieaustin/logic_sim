#!/usr/bin/env ruby

require_relative "../lib/DigitalLogic"

cir = DigitalLogic::Circuit.new

["gate", "gate1", "gate2", "gate3"].each do |name|
    cir.add_gate(name, :And)
end

cir.add_input("gate", "gate3")
cir.add_input("gate", true)

cir.add_input("gate1", true)
cir.add_input("gate1", true)

cir.add_input("gate2", true)
cir.add_input("gate2", false)

cir.add_input("gate3", "gate2")
cir.add_input("gate3", "gate1")

DigitalLogic::Analysis.analyze(cir, "gate")
