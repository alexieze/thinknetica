module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      @instances
    end

    def instance
      @instances ||= 0
      @instances += 1
    end
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.instance
    end
  end
end
