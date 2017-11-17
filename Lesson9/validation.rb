module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    def validate(name, type, condition = nil)
      @params ||= []
      @params << { name: name, type: type, condition: condition }
    end
  end

  module InstanceMethods

    def validate!
      p instance_variable_get(:params)
    end

    def valid?
      validate!
    rescue
      false
    end
  end
end