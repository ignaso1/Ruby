require 'simplecov'
SimpleCov.start
require './trainer.rb'

describe Trainer do
  context 'when not registered' do
    before do
      @trainer = Trainer.new
    end

    #TODO: SEPARATE USER TO CLIENT AND USER CLASSES, ADD INHERITANCE

    it 'can register' do
      expect { @trainer.register('Jonas Gains', 'treneris@jonas.lt', '1234') }
        .to change { @trainer.registered? }.from(false).to(true)
    end
  end
end
