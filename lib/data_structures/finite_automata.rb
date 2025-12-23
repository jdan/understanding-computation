# frozen_string_literal: true

module DataStructures
  ##
  # A Finite State Automate
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

    ##
    # Represents a list of rules and a mechanism to follow them
    RuleBook = Struct.new(:rules) do
      def next_state(state, symbol)
        rule_for(state, symbol).follow
      end

      def rule_for(state, symbol)
        rules.find { |rule| rule.applies?(state, symbol) }
      end
    end

    DFA = Struct.new(:current_state, :accepting_states, :rulebook) do
      def accepting?
        accepting_states.include?(current_state)
      end

      def read_one(symbol)
        self.current_state = rulebook.next_state(current_state, symbol)
      end

      def read_many(symbols)
        symbols.each { |symbol| read_one(symbol) }
      end
    end
  end
end
