require './spec_helper.rb'
describe User do
  before do
    @user1 = User.new
    @user = User.new
    @user.register('Ignas Obulaitis', 'ignasobulaitis@gmail.com',
                   'riebaludegimas')
    @user.login('ignasobulaitis@gmail.com', 'riebaludegimas')
  end

  it 'can register' do
    expect { @user1.register('Ignas O', 'ignaso@gmail.com', 'riebaludegimas') }
      .to change { @user1.registered? }.from(false).to(true)
  end

  it 'enters their name upon registration' do
    expect { @user1.register('Ignas O', 'ignaso@gmail.com', 'riebaludegimas') }
      .to change { @user1.account_details('full_name') }.from('').to('Ignas O')
  end

  it 'gets a unique account id upon registration' do
    expect { @user1.register('Ignas O', 'ignaso@gmail.com', 'riebaludegimas') }
      .to change { @user1.account_details('account_id') }
      .from(10_000).to(10_006)
  end

  it 'enters their email upon registration' do
    expect { @user1.register('Ignas O', 'ignaso@gmail.com', 'riebaludegimas') }
      .to change { @user1.account_details('email') }
      .from('').to('ignaso@gmail.com')
  end

  it 'enters their password upon registration' do
    expect { @user1.register('Ignas O', 'ignaso@gmail.com', 'riebaludegimas') }
      .to change { @user1.account_details('password') }
      .from('').to('riebaludegimas')
  end

  it 'can see their account information' do
    expect(@user.account_details('full_name')).to eql('Ignas Obulaitis')
    expect(@user.account_details('email')).to eql('ignasobulaitis@gmail.com')
    expect(@user.account_details('password')).to eql('riebaludegimas')
  end

  it 'can login' do
    @user1.register('Ignas O', 'ignaso@gmail.com',
                    'riebaludegimas')
    expect { @user1.login('ignaso@gmail.com', 'riebaludegimas') }
      .to change { @user1.account_details('is_logged_in') }.from(false).to(true)
  end

  it 'must enter the right password and email to login' do
    @user1.register('Ignas O', 'ignaso@gmail.com', 'riebaludegimas')
    expect(@user1.login('ignas@gmail.com', 'riebaludegimas')).to be false
    expect(@user1.login('ignaso@gmail.com', 'riebaludengimas')).to be false
  end

  it 'can enter their gender' do
    gender = 'M'
    expect { @user.add_details(gender) }
      .to change { @user.details? }.from(false).to(true)
    expect(@user.account_details('gender')).to eql('M')
  end

  it 'can enter their birth date' do
    birth_date = '1997-02-04'
    expect { @user.add_details(birth_date) }
      .to change { @user.details? }.from(false).to(true)
    expect(@user.account_details('birth_date')).to eql('1997-02-04')
  end

  it 'can add a bank account' do
    number = 'LT_567_300_000_000_000_000'
    expect { @user.bank_account_number = number }
      .to change { @user.account_details('bank_account_number') }
      .from('').to('LT_567_300_000_000_000_000')
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

  it 'can order a meal plan' do
    birth_date = '1997-02-04'
    @user.add_details(birth_date)
    expect { @user1.order_meal_plan }
      .to change { @user1.account_details('meal_plan') }.from(false).to(true)
  end

  it 'can order a workout plan' do
    birth_date = '1997-02-04'
    @user.add_details(birth_date)
    expect { @user1.order_workout_plan }
      .to change { @user1.account_details('workout_plan') }.from(false).to(true)
  end

  it 'can logout' do
    expect { @user.logout }
      .to change { @user.account_details('is_logged_in') }.from(true).to(false)
  end
end
