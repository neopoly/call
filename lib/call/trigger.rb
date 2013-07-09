module Call
  class Trigger
    class << self
      attr_accessor :response_class
    end

    def initialize(&block)
      raise ArgumentError, 'Block required' if block.nil?
      @callback = block
    end

    private

    def call(response_type, *args)
      response = self.class.response_class.new(response_type, *args)
      @callback.call response
    end
  end
end
