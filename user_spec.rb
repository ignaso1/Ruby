require 'simplecov'
SimpleCov.start

require './user.rb'
require './account_spec.rb'

describe User do
  context 'when not registered' do
    before do
      @user = User.new
    end

    it 'gets a unique account id upon registration' do
      expect { @user.register('Ignas O', 'ignaso@gmail.com', 'riebaludegimas') }
        .to change { @user.information('account_id') }
        .from(0).to(10_001)
    end
  end

  context 'when logged in' do
    before do
      @user = User.new
      @user.register('Ignas Obulaitis', 'ignasobulaitis@gmail.com',
                     'riebaludegimas')
      @user.login('ignasobulaitis@gmail.com', 'riebaludegimas')
    end

    it 'can set their height and weight' do
      height = 180
      expect { @user.height = height }
        .to change { @user.account_details('height') }
        .from(0).to(180)
    end

    it 'can set their weight' do
      weight = 85
      expect { @user.weight = weight }
        .to change { @user.account_details('weight') }
        .from(0).to(85)
    end

    it 'can set a goal' do
      goal = 'lose weight'
      expect { @user.goal = goal }
        .to change { @user.account_details('goal') }
        .from('').to('lose weight')
    end

    it 'can set their physical activity level' do
      activity_level = 2
      expect { @user.activity_level = activity_level }
        .to change { @user.account_details('activity_level') }
        .from(0).to(2)
    end

    it 'must enter details to order a meal plan' do
      expect(@user.order_meal_plan).to be false
    end

    it 'can order a meal plan' do
      birth_date = '1997-02-04'
      @user.add_details(birth_date)
      expect { @user.order_meal_plan }
        .to change { @user.account_details('meal_plan') }
        .from(false).to(true)
    end

    it 'must enter details to order a workout plan' do
      expect(@user.order_workout_plan).to be false
    end

    it 'can order a workout plan' do
      birth_date = '1997-02-04'
      @user.add_details(birth_date)
      expect { @user.order_workout_plan }
        .to change { @user.account_details('workout_plan') }
        .from(false).to(true)
    end
  end
end
