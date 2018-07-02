module Scribble
  Registry.for Integer do
    name 'number'

    to_boolean { !zero? }
    to_string  { to_s }

    # Logical operators
    method :or,  Object, cast: 'to_boolean'
    method :and, Object, cast: 'to_boolean'

    # Equality
    method :equals,  Integer, as: '=='
    method :differs, Integer, as: '!='
    method :equals,  Object, returns: false
    method :differs, Object, returns: true

    # Comparisons
    method :greater,          Integer, as: '>'
    method :greater_or_equal, Integer, as: '>='
    method :less,             Integer, as: '<'
    method :less_or_equal,    Integer, as: '<='

    # Calculations
    method :add,       Integer, as: '+'
    method :subtract,  Integer, as: '-'
    method :multiply,  Integer, as: '*'
    method :remainder, Integer, as: '%'

    method :divide,    Integer, to: ->(n) {
      begin
        self / n
      rescue ZeroDivisionError
        raise Errors::UnlocatedArgument.new "Division by zero"
      end
    }

    # Unary operators
    method :negative, to: -> { -self }
    method :not, cast: 'to_boolean'

    # String manipulations
    method :add,      String, cast: 'to_string'
    method :multiply, String, to: ->(string) { Support::Utilities.repeat string, self }

    # Unary methods
    method :abs
    method :odd,  as: 'odd?'
    method :even, as: 'even?'
    method :zero, as: 'zero?'
    method :nonzero,  to: -> { self != 0 }
  end
end
