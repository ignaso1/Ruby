require 'simplecov'
SimpleCov.start
require './trainer.rb'

describe Trainer do
  context 'when not registered' do
    before do
      @trainer = Trainer.new
    end

    it 'can register' do
      expect { @trainer.register('Jonas Gains', 'treneris@jonas.lt', '1234') }
        .to change { @trainer.registered? }.from(false).to(true)
    end

    it 'enters their name upon registration' do
      expect { @trainer.register('Jonas Gains', 'treneris@jonas.lt', '1234') }
        .to change { @trainer.information('full_name') }.from('').to('Jonas Gains')
    end

    it 'gets a unique account id upon registration' do
      expect { @trainer.register('Jonas Gains', 'treneris@jonas.lt', '1234') }
        .to change { @trainer.information('account_id') }
        .from(0).to(20_003)
    end
  end
end
