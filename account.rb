# Account class used as a base for other classes
class Account
  @count = 0

  class << self
    attr_accessor :count
  end

  def initialize(account_type = 0)
    self.class.count += 1
    @information = { gender: '', birthday: '',
                     is_logged_in: false, account_id: 0,
                     bank_account_number: '' }
    @information[:account_type] = account_type
  end

  def register(full_name, email, password)
    @information[:account_id] = self.class.count +
                                @information.fetch(:account_type)
    @information[:full_name] = full_name
    @information[:email] = email
    @information[:password] = password
  end

  def login(email_value, password_value)
    return false unless email_value.eql?(@information.fetch(:email)) &&
                        password_value.eql?(@information.fetch(:password))
    @information[:is_logged_in] = true
  end

  def logout
    @information[:is_logged_in] = false
  end

  def details?
    return true unless @information.fetch(:gender).empty? &&
                       @information.fetch(:birthday).empty?
    false
  end

  def registered?
    return true unless @information.fetch(:account_id).equal?(0)
    false
  end

  def information(symbol)
    @information.fetch(symbol.to_sym)
  end

  def bank_account_number=(information)
    @information[:bank_account_number] = information
  end

  def gender(value)
    return false unless value.length.equal?(1)
    @information[:gender] = value
  end

  def birthday(value)
    @information[:birthday] = value unless value.length.equal?(1)
  end
end
