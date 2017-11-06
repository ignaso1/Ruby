# Trainer class used for the workout and meal program
class Trainer
  @id = 0
  class << self
    attr_accessor :id
  end
  def initialize
    self.class.id += 1
    @account_details = { account_id: 20_000 }
  end

  def register(full_name, email, password)
    @account_details[:account_id] = 20_000 + self.class.id
  end

  def registered?
    return true unless @account_details.fetch(:account_id).equal?(20_000)
    false
  end
end
