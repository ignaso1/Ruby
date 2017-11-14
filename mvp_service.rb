require './trainer.rb'
require './user.rb'
require './account.rb'

# Meal and workout program's service class, responsible for
# interacting with user interface and managing all classes
class MvpService
  attr_reader :user
  # SAVE STATES AND LOAD STATES, RSPEC SAVInG AND LOADING (YAML)
  # CREATE UI
  def initialize
    @user = nil
  end

  def create_account(type)
    return false unless type.eql?('User') || type.eql?('Trainer')
    @user = Object.const_get(type)
    true
  end

  def validate
    return false unless @user.information('is_logged_in')
    true
  end

  def register(full_name, email, password)
    @user.register(full_name, email, password)
    'Registered successfully.'
  end

  def login(email, password)
    @user.login(email, password)
    return 'Logging in failed.' unless validate
    'Logged in successfully.'
  end

  def logout
    return 'You are already logged out' unless validate
    @user.logout
    'Logged out successfully.'
  end

  def bank_account_number(value)
    @user.bank_account_number = value
    'Bank account added successfully.'
  end

  def gender(value)
    return 'Gender must be a single letter M or F.' unless
    value.length.equal?(1)
    @user.add_details(value)
    'Gender set successfully.'
  end

  def birth_date(value)
    return 'Birth date must contain more than 1 symbol.' unless value.length > 1
    @user.add_details(value)
    'Birth date set successfully.'
  end

  def view_information
    info = 'Account information:\nAccount Type:' +
           @user.class.name.split('::').last
    info += main_details
    info += additional_details
    info
  end

  def main_details
    info += '\nEmail: ' + @user.information('email') +
            '\nName: ' + @user.information('full_name')
    info
  end

  def additional_details
    info += '\nGender: ' + @user.information('gender') +
            '\nBirth Date: ' + @user.information('birth_date') +
            '\nBank Account Number: ' + @user.information('bank_account_number')
    info
  end


end
