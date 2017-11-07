require 'simplecov'
SimpleCov.start

require './mvp_service.rb'

describe MvpService do
  before do
    @service = MvpService.new
  end

  it 'can register a new user' do
  	usr_name = 'Ignas'
  	usr_password = '2017Ruby*10h'
    usr_email = 'ignas@obulaitis.it'
    acc_type = 'User'
    expect(@service.register_user(usr_name, usr_email, usr_password))
      .to match('Registered successfully')
  end
end