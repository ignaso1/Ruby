require './account.rb'
# Trainer class used for the workout and meal program
class Trainer < Account
  @count = 0

  def initialize
    @information = {}
    super()
    @information[:account_type] = 20_000
  end

end
