require 'simplecov'
SimpleCov.start
require './trainer.rb'
require './account_spec.rb'

describe Trainer do
  context 'when not registered' do
    before do
      @trainer = Trainer.new
    end

    it 'gets a unique account id upon registration' do
      expect { @trainer.register('Jonas Gains', 'treneris@jonas.lt', '1234') }
        .to change { @trainer.information('account_id') }
        .from(0).to(20_001)
    end

  end
end
