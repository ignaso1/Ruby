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
  context 'when logged in' do
    before do
      @trainer = Trainer.new
      @trainer.register('Jonas Gains', 'treneris@jonas.lt', '1234')
      @trainer.login('treneris@jonas.lt', '1234')
    end

    it 'can enter trainer\'s license number' do
      expect { @trainer.license_number = 555_666_902 }
        .to change { @trainer.preferences('license_number')}
        .from(0).to(555_666_902)
    end

    it 'can choose to create meal plans ' do
      expect { @trainer.create_meal_plans }
        .to change { @trainer.preferences('meal_plans')}
        .from(false).to(true)
    end

    it 'can choose to create workout plans ' do
      expect { @trainer.create_workout_plans }
        .to change { @trainer.preferences('workout_plans')}
        .from(false).to(true)
    end
  end
end
