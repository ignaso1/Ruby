require 'simplecov'
SimpleCov.start

require './account.rb'

describe Account do
  context 'when not registered' do
    before do
      @account = Account.new
      @account1 = Account.new(10_000)
    end

    it 'can register' do
      expect { @account.register('Ignas O', 'ignaso@gmail.com', 'degimas') }
        .to change { @account.registered? }.from(false).to(true)
    end

    it 'enters their name upon registration' do
      expect { @account.register('Ignas O', 'ignaso@gmail.com', 'degimas') }
        .to change { @account.information('full_name') }.from('').to('Ignas O')
    end

    it 'gets a unique account id upon registration, based on account type' do
      expect { @account1.register('Ignas O', 'ignaso@gmail.com', 'degimas') }
        .to change { @account1.information('account_id') }
        .from(0).to(10_006)
    end

    it 'can specify it\'s type on creation' do
      expect(@account.information('account_type')).to eql(0)
      expect(@account1.information('account_type')).to eql(10_000)
    end

    it 'enters their email upon registration' do
      expect { @account.register('Ignas O', 'ignaso@gmail.com', 'degimas') }
        .to change { @account.information('email') }
        .from('').to('ignaso@gmail.com')
    end

    it 'enters their password upon registration' do
      expect { @account.register('Ignas O', 'ignaso@gmail.com', 'degimas') }
        .to change { @account.information('password') }
        .from('').to('degimas')
    end
  end

  context 'when registered, but not logged in' do
    before do
      @account = Account.new
      @account.register('Ignas Obulaitis', 'ignasobulaitis@gmail.com',
                        'degimas')
    end

    it 'can login' do
      expect { @account.login('ignasobulaitis@gmail.com', 'degimas') }
        .to change { @account.information('is_logged_in') }
        .from(false).to(true)
    end

    it 'must enter the right password and email to login' do
      expect(@account.login('ignas@gmail.com', 'degimas')).to be false
      expect(@account.login('ignasobulaitis@gmail.com', 'riebaludengimas'))
        .to be false
    end
  end

  context 'when logged in' do
    before do
      @account = Account.new
      @account.register('Ignas Obulaitis', 'ignasobulaitis@gmail.com',
                        'degimas')
      @account.login('ignasobulaitis@gmail.com', 'degimas')
    end

    it 'can see their account information' do
      expect(@account.information('full_name')).to eql('Ignas Obulaitis')
      expect(@account.information('email')).to eql('ignasobulaitis@gmail.com')
      expect(@account.information('password')).to eql('degimas')
    end

    it 'can enter their gender' do
      gender = 'M'
      expect { @account.add_details(gender) }
        .to change { @account.details? }.from(false).to(true)
      expect(@account.information('gender')).to eql('M')
    end

    it 'can enter their birth date' do
      birth_date = '1997-02-04'
      expect { @account.add_details(birth_date) }
        .to change { @account.details? }.from(false).to(true)
      expect(@account.information('birth_date')).to eql('1997-02-04')
    end

    it 'can add a bank account' do
      number = 'LT_567_300_000_000_000_000'
      expect { @account.bank_account_number = number }
        .to change { @account.information('bank_account_number') }
        .from('').to('LT_567_300_000_000_000_000')
    end

    it 'can logout' do
      expect { @account.logout }
        .to change { @account.information('is_logged_in') }
        .from(true).to(false)
    end
  end
end
