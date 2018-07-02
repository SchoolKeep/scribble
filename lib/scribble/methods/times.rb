module Scribble
  module Methods
    class Times < Block
      register :times, on: Integer

      def times
        render * @receiver
      end
    end
  end
end
