# frozen_string_literal: true

require 'spec_helper'
require 'data_structures/finite_automata'

RSpec.describe DataStructures::FiniteAutomata::Rule do
  describe '#applies?' do
    it 'returns true when state and symbol match' do
      rule = described_class.new(1, 'a', 2)

      expect(rule.applies?(1, 'a')).to be true
    end

    it 'returns false when state does not match' do
      rule = described_class.new(1, 'a', 2)

      expect(rule.applies?(2, 'a')).to be false
    end

    it 'returns false when symbol does not match' do
      rule = described_class.new(1, 'a', 2)

      expect(rule.applies?(1, 'b')).to be false
    end
  end

  describe '#follow' do
    it 'returns the next_state' do
      rule = described_class.new(1, 'a', 2)

      expect(rule.follow).to eq(2)
    end
  end
end
