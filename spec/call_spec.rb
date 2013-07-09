require 'helper'

require 'ostruct'

describe Call do
  it 'creates a Trigger-Class' do
    trigger_class = Call.new(:success, :failure)

    assert_equal Call::Trigger, trigger_class.superclass
  end

  it 'builds response methods' do
    trigger_class = Call.new(:success, :failure)

    trigger = trigger_class.new do
    end

    assert trigger.respond_to? :success
    assert trigger.respond_to? :failure
  end

  it 'is needs a block' do
    trigger_class = Call.new(:success, :failure)

    assert_raises ArgumentError do
      trigger_class.new
    end
  end

  it 'calls the block with a response object' do
    @calls = []

    trigger_class = Call.new(:success, :failure)

    trigger = trigger_class.new do |on|
      on.success do |*args|
        @calls << OpenStruct.new(:type => :success, :args => args)
      end

      on.failure do |*args|
        @calls << OpenStruct.new(:type => :failure, :args => args)
      end
    end

    trigger.success '12', :b
    trigger.failure 22

    assert_equal 2, @calls.size

    assert_equal :success,    @calls[0].type
    assert_equal ['12', :b],  @calls[0].args

    assert_equal :failure,    @calls[1].type
    assert_equal [22],        @calls[1].args
  end
end
