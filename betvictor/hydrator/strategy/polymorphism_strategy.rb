module Betvictor
  module Hydrator

    class PolymorphismStrategy < BasicStrategy

      @polymorphism

      def initialize(mapping, polymorphism)
        super(mapping, Object)
        @polymorphism = polymorphism
      end

      def hydrate(hash)
        @object_class = self.polymorphism(hash, :object)
        super(hash)
      end

      protected

      def polymorphism(hash, info)
        type = hash[@polymorphism[:field]]
        @polymorphism[:objects][type][info]
      end

      def map(mapping, hash, object)
        mapping = mapping.merge(self.polymorphism(hash, :mapping))
        super(mapping, hash, object)
      end

    end

  end
end