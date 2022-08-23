class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...

    names.map(&:to_s).each do |name|
      define_method(name) do
        self.instance_variable_get("@#{name}")
        # name.instance_variable_set("@#{name}")
      end

      attr_reader :person

      def person
        return @person
      end

      attr_writer :person

      def person=(val)
        return @person = val 
      end

      define_method(name + '=') do |var|
        self.instance_variable_set("@#{name}",var)
      end

    end
  end
end
