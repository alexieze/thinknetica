module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethod
  end

  module ClassMethods

    def instances
      @instances
    end

    protected
    def instance
      @instances ||=0
      @instances +=1
    end
  end

  module InstanceMethod

    protected
    def register_instance
      self.class.instance
    end
  end
end