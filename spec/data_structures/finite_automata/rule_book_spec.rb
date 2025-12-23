# frozen_string_literal: true

require 'spec_helper'
require 'data_structures/finite_automata'

RSpec.describe DataStructures::FiniteAutomata::RuleBook do
  let(:rules) do
    [
      DataStructures::FiniteAutomata::Rule.new(1, 'a', 2),
      DataStructures::FiniteAutomata::Rule.new(2, 'b', 3),
      DataStructures::FiniteAutomata::Rule.new(1, 'b', 1)
    ]
  end
  let(:rule_book) { described_class.new(rules) }

  describe '#rule_for' do
    it 'returns the rule matching the given state and symbol' do
      rule = rule_book.rule_for(1, 'a')

      expect(rule.next_state).to eq(2)
    end

    it 'returns nil when no rule matches' do
      rule = rule_book.rule_for(3, 'a')

      expect(rule).to be_nil
    end
  end

  describe '#next_state' do
    it 'returns the next state for a given state and symbol' do
      expect(rule_book.next_state(1, 'a')).to eq(2)
    end

    it 'follows multiple transitions' do
      expect(rule_book.next_state(1, 'a')).to eq(2)
      expect(rule_book.next_state(2, 'b')).to eq(3)
    end

    it 'handles self-loops' do
      expect(rule_book.next_state(1, 'b')).to eq(1)
    end
  end
end
