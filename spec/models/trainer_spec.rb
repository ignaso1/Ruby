# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe Trainer, type: :model do
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
        .to change { @trainer.preferences('license_number') }
        .from(0).to(555_666_902)
    end

    it 'can choose to create meal plans ' do
      expect { @trainer.create_meal_plans }
        .to change { @trainer.preferences('meal_plans') }
        .from(false).to(true)
    end

    it 'can choose to create workout plans ' do
      expect { @trainer.create_workout_plans }
        .to change { @trainer.preferences('workout_plans') }
        .from(false).to(true)
    end

    it 'can choose to provide personal trainer services ' do
      expect { @trainer.provide_personal_trainer_services }
        .to change { @trainer.preferences('trainer_services') }
        .from(false).to(true)
    end

    it 'can choose to provide personal dietician services ' do
      expect { @trainer.provide_personal_dietician_services }
        .to change { @trainer.preferences('dietician_services') }
        .from(false).to(true)
    end

    it 'can set the price of meal plans' do
      expect { @trainer.set_prices('meal_plans', 200) }
        .to change { @trainer.preferences('meal_plans_price') }
        .from(0).to(200)
    end

    it 'can set the price of workout plans' do
      expect { @trainer.set_prices('workout_plans', 200) }
        .to change { @trainer.preferences('workout_plans_price') }
        .from(0).to(200)
    end

    it 'can set the price of personal trainer services' do
      expect { @trainer.set_prices('trainer_services', 500) }
        .to change { @trainer.preferences('trainer_services_price') }
        .from(0).to(500)
    end

    it 'can set the price of personal dietician services' do
      expect { @trainer.set_prices('dietician_services', 500) }
        .to change { @trainer.preferences('dietician_services_price') }
        .from(0).to(500)
    end
  end
end
