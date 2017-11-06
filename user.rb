# User class used for the workout and meal program
class User
  @id = 0
  class << self
    attr_accessor :id
  end
  def initialize
    self.class.id += 1
    @account_details = { meal_plan: false, workout_plan: false,
                         activity_level: 0,
                         height: 0, weight: 0, goal: '',
                         gender: '', birth_date: '',
                         is_logged_in: false, account_id: 10_000,
                         email: '', password: '', full_name: '',
                         bank_account_number: '' }
  end

  def register(full_name, email, password)
    @account_details[:account_id] = 10_000 + self.class.id
    @account_details[:full_name] = full_name
    @account_details[:email] = email
    @account_details[:password] = password
  end

  def login(email_value, password_value)
    return false unless email_value.eql?(@account_details.fetch(:email)) &&
                        password_value.eql?(@account_details.fetch(:password))
    @account_details[:is_logged_in] = true
  end

  def logout
    @account_details[:is_logged_in] = false
  end

  def details?
    return true unless @account_details.fetch(:gender).empty? &&
                       @account_details.fetch(:birth_date).empty?
    false
  end

  def registered?
    return true unless @account_details.fetch(:account_id).equal?(10_000)
    false
  end

  def account_details(symbol)
    @account_details.fetch(symbol.to_sym)
  end

  def bank_account_number=(account_details)
    @account_details[:bank_account_number] = account_details
  end

  def add_details(detail_value)
    if detail_value.length.equal?(1)
      @account_details[:gender] = detail_value
    else
      @account_details[:birth_date] = detail_value
    end
  end

  def order_meal_plan
    return false unless details?
    @account_details[:meal_plan] = true
  end

  def order_workout_plan
    return false unless details?
    @account_details[:workout_plan] = true
  end

  def height=(account_details)
    @account_details[:height] = account_details
  end

  def weight=(account_details)
    @account_details[:weight] = account_details
  end

  def goal=(account_details)
    @account_details[:goal] = account_details
  end

  def activity_level=(account_details)
    @account_details[:activity_level] = account_details
  end

end
