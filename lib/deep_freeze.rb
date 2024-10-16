# frozen_string_literal: true

require_relative "deep_freeze/version"

module DeepFreeze
  def deep_freeze(obj)
    case obj
    when String, Numeric, Symbol, NilClass, TrueClass, FalseClass
      obj.freeze
    when Hash
      obj.each { |k,v| deep_freeze(k); deep_freeze(v) }
      obj.freeze
    when Array
      obj.each { |idx| deep_freeze(idx) }
      obj.freeze
    else
      raise "Can't deep freeze objects of class #{obj.class} "
    end
  end
end
