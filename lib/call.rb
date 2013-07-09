require 'call/version'
require 'call/trigger'

module Call
  def self.new(*callbacks)
    Class.new(Trigger) do
    end
  end
end
