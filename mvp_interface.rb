require './mvp_service.rb'

# User interface for Meal and Workout Program
class MvpInterface
  def initialize
  	@service = MvpService.new
  end

  def clear_console
	Gem.win_platform? ? (system "cls") : (system "clear")
  end

  def start
  	clear_console
    puts 'This is the Meal and Workout Program.'
    loop do
      puts 'Please select what you want to do:'
      puts '1 - register'
      puts '2 - login'
      puts 'q - quit'
      choice1 = gets.chomp
      case choice1
      when '1'
        registration
      when '2'
        puts 'logins'
      when 'q'
        puts 'Quitting'
        break
      else
        puts 'no such choice'
      end
    end
  end

  def registration
  	clear_console
  	loop do
      puts 'Registration'
      puts 'Are you a user or a trainer?'
      puts '1 - User'
      puts '2 - Trainer'
      puts 'q - Cancel registration'
      choice2 = gets.chomp
      case choice2
      when '1'
        user = 'User'
        if @service.create_account(user)
      	    user_registration
        end
        break
      when '2'
      	clear_console
      	user = 'Trainer'
      	if @service.create_account(user)
      	  puts 'Creating trainer account'
      	  break
      	end
      when 'q'
      	clear_console
      	puts 'Cancelled registration'
      	break
      else
      	clear_console
      	puts 'No such choice'
      end
    end
  end

  def user_registration
    clear_console
    @service.getuser
    puts 'Creating user account'
    print 'Name: '
    user_name = gets.chomp
    print 'Last Name: '
    user_lname = gets.chomp
    full_name = user_name + ' ' + user_lname
    print 'Email: '
    email = gets.chomp
    print 'Password: '
    pwd = gets.chomp
    puts @service.register(full_name, email, pwd)
  end

end

ui = MvpInterface.new
ui.start