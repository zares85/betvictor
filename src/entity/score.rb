module Betvictor
  module Entity

    class Score

      attr_accessor :id

      def home
        @id.split('-')[0].to_i
      end

      def away
        @id.split('-')[1].to_i
      end

    end

  end
end