require './trainer.rb'
require './user.rb'

# Meal and workout program's service class, responsible for
# interacting with user interface and managing all classes
class MvpService
  attr_reader :user

  def initialize
    @user = nil
  end

  def create_account(type)
    return false unless type.eql?('User')
    @user = User.new
    true
  end

  def register_user(full_name, email, password)
    @user = User.new
    @user.register(full_name, email, password)
    return 'Registration failed' unless @user.registered?
    'Registered successfully'
  end
end
