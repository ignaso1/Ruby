require './account.rb'
# Trainer class used for the workout and meal program
class Trainer < Account
  @count = 0

  def initialize
    @information = {}
    @preferences = { meal_plans: false }
    super()
    @information[:account_type] = 20_000
  end

  def preferences(symbol)
    @preferences.fetch(symbol.to_sym)
  end

  def create_meal_plans
    @preferences[:meal_plans] = true
  end
end
