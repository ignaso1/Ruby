require './account.rb'
# User class used for the workout and meal program
class User < Account
  @count = 0

  def initialize
    super(10_000)
    @account_details = { meal_plan: false, workout_plan: false,
                         activity_level: 0,
                         height: 0, weight: 0, goal: '' }
  end

  def account_details(symbol)
    @account_details.fetch(symbol.to_sym)
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
