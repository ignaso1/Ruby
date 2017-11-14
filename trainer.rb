require './account.rb'
# Trainer class used for the workout and meal program
class Trainer < Account
  @count = 0

  def initialize
    super()
    @preferences = { meal_plans: false, license_number: 0,
                     workout_plans: false, trainer_services: false,
                     dietician_services: false, meal_plans_price: 0,
                     workout_plans_price: 0, trainer_services_price: 0,
                     dietician_services_price: 0 }
    @information[:account_type] = 20_000
  end

  def preferences(symbol)
    @preferences.fetch(symbol.to_sym)
  end

  def license_number=(value)
    @preferences[:license_number] = value
  end

  def create_meal_plans
    @preferences[:meal_plans] = true
  end

  def create_workout_plans
    @preferences[:workout_plans] = true
  end

  def provide_personal_trainer_services
    @preferences[:trainer_services] = true
  end

  def provide_personal_dietician_services
    @preferences[:dietician_services] = true
  end

  def set_prices(services, price)
    service_price = services + '_price'
    @preferences[service_price.to_sym] = price
  end
end
