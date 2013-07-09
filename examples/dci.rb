require 'call'

User = Struct.new(:name)

class CreatingUser
  Trigger = Call.new(:success, :failure)
  Response = Struct.new(:name)

  def initialize(username)
    @username = username
  end

  def call(&block)
    trigger = Trigger.new(&block)

    raise "invalid username" if @username.start_with?'A'
    user = User.new(@username)

    trigger.success Response.new(user.name)

  rescue RuntimeError => e
    trigger.failure e.message
  end
end


CreatingUser.new('My Account').call do |on|
  on.success do |user|
    p :user_account => user
  end

  on.failure do |error|
    p :error => error
  end
end

CreatingUser.new('An Account').call do |on|
  on.success do |user|
    p :user_account => user
  end

  on.failure do |error|
    p :error => error
  end
end
