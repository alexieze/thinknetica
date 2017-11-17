module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    attr_reader :validations

    def validate(name, type, params = nil)
      @validations ||= []
      @validations << { name: name, type: type, params: params }

    end
  end

  module InstanceMethods

    def validate!
      self.class.validations.each do |value|
        value_var = instance_variable_get("@#{value[:name].to_s}")
        send value[:type], value_var, value[:params]
      end
    end

    def valid?
      validate!
    rescue
      false
    end

    private

    def type(value, class_name)
      raise 'Тип переменной не верный' unless value.instance_of?(class_name)
    end

    def format(value, param)
      raise 'Неверный формат числа' if value != param
    end

    def presence(value)
      raise 'Значение не должно быть пустым' unless value
    end
  end
end