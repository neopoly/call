module Call
  class Response
    def initialize(type, *args)
      @type = type
      @args = args
    end

    private
    def trigger_responded(type, &block)
      if type == @type
        block.call(*@args)
      end
    end
  end
end
