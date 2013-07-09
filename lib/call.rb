require 'call/version'
require 'call/trigger'
require 'call/response'

module Call
  def self.new(*responses)
    Class.new(Trigger) do
      responses.each do |response|
        define_method response do |*args|
          call response, *args
        end
      end

      self.response_class = Class.new(Response) do
        responses.each do |response|
          define_method response do |&block|
            trigger_responded(response, &block)
          end
        end
      end
    end

  end
end
