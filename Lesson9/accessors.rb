module Accessors
  def attr_accessor_with_history(*args)
    args.each do |name|
      instance_var = ("@#{name}").to_sym
      history_var = ("@#{name}_history").to_sym
      define_method(name) { instance_variable_get(instance_var) }
      define_method(name.to_s + '_history') { instance_variable_get(history_var) }
      define_method("#{name}=".to_sym) do |val|
        instance_variable_set(instance_var, val)
        data_history = instance_variable_get(history_var)
        if data_history
          data_history[val] = val unless data_history[val]
        else
          data_history = {}
          data_history[val] = val
          instance_variable_set(history_var, data_history)
        end
      end
    end
  end

  def strong_attr_accessor(name, class_name)
    instance_var = "@#{name}".to_sym
    define_method(name) { instance_variable_get(instance_var) }
    define_method("#{name}".to_sym) do |value|
      if name.instance_of?(class_name)
        instance_variable_set(instance_var, value)
      else
        raise 'Ошибка, не является наследникоа проверочного класса'
      end
    end
  end
end
