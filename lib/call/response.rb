module Call
  class Response
    attr_reader :type, :args

    def initialize(type, *args)
      @type = type
      @args = args
    end

    private
    def trigger_responded(type, &block)
      if type == self.type
        block.call(*@args)
      end
    end
  end
end
