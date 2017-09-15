module Betvictor
  module Entity

    class Price

      attr_accessor :id, :name

      def decimal
        @name.split('/').inject {|a, b| a.to_f / b.to_f} + 1
      end

    end

  end
end