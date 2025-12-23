# frozen_string_literal: true

require 'spec_helper'
require 'data_structures/finite_automata'

RSpec.describe DataStructures::FiniteAutomata::DFA do
  let(:rules) do
    [
      DataStructures::FiniteAutomata::Rule.new(1, 'a', 2),
      DataStructures::FiniteAutomata::Rule.new(2, 'a', 2),
      DataStructures::FiniteAutomata::Rule.new(2, 'b', 3),
      DataStructures::FiniteAutomata::Rule.new(3, 'a', 3),
      DataStructures::FiniteAutomata::Rule.new(3, 'b', 3)
    ]
  end
  let(:rulebook) { DataStructures::FiniteAutomata::RuleBook.new(rules) }
  let(:dfa) { described_class.new(1, [3], rulebook) }

  describe '#accepting?' do
    it 'returns false when current state is not an accepting state' do
      expect(dfa.accepting?).to be false
    end

    it 'returns true when current state is an accepting state' do
      dfa.current_state = 3

      expect(dfa.accepting?).to be true
    end
  end

  describe '#read_one' do
    it 'transitions to the next state based on the symbol' do
      dfa.read_one('a')

      expect(dfa.current_state).to eq(2)
    end

    it 'can reach an accepting state' do
      dfa.read_one('a')
      dfa.read_one('b')

      expect(dfa.accepting?).to be true
    end
  end

  describe '#read_many' do
    it 'processes multiple symbols in sequence' do
      dfa.read_many(%w[a b])

      expect(dfa.accepting?).to be true
    end

    it 'stays in accepting state with additional input' do
      dfa.read_many(%w[a b a b])

      expect(dfa.accepting?).to be true
      expect(dfa.current_state).to eq(3)
    end
  end
end
