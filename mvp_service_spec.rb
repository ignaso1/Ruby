require './service_spec_helper.rb'

describe MvpService do
  before do
    @service = MvpService.new
  end

  it 'can create an unregistered user account' do
    expect { @service.create_account('User') }
      .to change { @service.user }
      .from(nil).to(User)
  end

  it 'cannot create an account of unknown type' do
    expect { @service.create_account('Animal') }
      .not_to change { @service.user }
      .from(nil)
  end

  it 'can register a new user' do
    usr_name = 'Ignas'
    usr_password = '2017Ruby*10h'
    usr_email = 'ignas@obulaitis.it'
    expect(@service.register_user(usr_name, usr_email, usr_password))
      .to match('Registered successfully')
  end
end
