module Herbaltee
  class Binder < BasicObject
    attr_reader :__vars__
    def __binding__
      ::Kernel.binding
    end

    def initialize(vars = {})
      basic_object_methods = [
        :equal?,
        :instance_eval,
        :instance_exec,
        :method_missing,
        :singleton_method_added,
        :singleton_method_removed,
        :singleton_method_undefied,
      ]
      if (basic_object_methods & vars.keys).any?
        ::Kernel.raise "Invalid variable name"
      end
      @__vars__ = vars
    end

    def method_missing(meth, *args)
      if @__vars__ && @__vars__.has_key?(meth)
        @__vars__[meth]
      else
        super
      end
    end
  end
end
