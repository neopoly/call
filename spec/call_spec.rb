require 'helper'

describe Call do
  it 'creates a Trigger-Class' do
    trigger_class = Call.new(:success, :failure)

    assert_equal Call::Trigger, trigger_class.superclass
  end
end
