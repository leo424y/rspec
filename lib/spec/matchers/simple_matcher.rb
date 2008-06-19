module Spec
  module Matchers
    class SimpleMatcher
      attr_accessor :description
      attr_writer :failure_message, :negative_failure_message
      
      def initialize(description, &match_block)
        @description = description
        @match_block = match_block
      end

      def matches?(actual)
        @actual = actual
        @match_block.arity == 2 ?
          @match_block.call(@actual, self) :
          @match_block.call(@actual)
      end

      def failure_message
        @failure_message || %[expected #{@description.inspect} but got #{@actual.inspect}]
      end

      def negative_failure_message
        @negative_failure_message || %[expected not to get #{@description.inspect}, but got #{@actual.inspect}]
      end
      
    end

    def simple_matcher(message, &match_block)
      SimpleMatcher.new(message, &match_block)
    end
  end
end