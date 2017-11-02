module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethod
  end

  module ClassMethods

    def instance
      @instances
    end

    protected
    attr_accessor :instances
    def instances
      @instances ||=0
      @instances +=1
    end
  end

  module InstanceMethod

    protected
    def register_instance
      self.class.instances
    end
  end
end