# frozen_string_literal: true

module DataStructures
  module FiniteAutomata
    ##
    # Represents a single rule in a Finite State Automata
    Rule = Struct.new(:state, :symbol, :next_state) do
      def applies?(state, symbol)
        self.state == state && self.symbol == symbol
      end

      def follow
        next_state
      end
    end
  end
end
