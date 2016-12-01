# bot.rb
require 'facebook/messenger'
include Facebook::Messenger
require 'net/http'
require 'json'

# Facebook::Messenger.configure do |config|
#   # config.access_token = ENV['PAGE_ACCESS_TOKEN']
#   # config.verify_token = ENV['VERIFY_TOKEN']
#   config.provider = Configuration::Providers::Environment.new
# end

Bot.on :message do |message|
  
	case message.text
  
	when /zipcode/i
  		zipcode = message.text.split
  	
  		if zipcode.length == 2 and zipcode[1].length == 5
  			user_zipcode = zipcode[1]

  			Bot.deliver(
        		recipient: message.sender,
       			message: {
          			text: "This is your zipcode: #{user_zipcode}."
        		}
        	)
  		else
  			Bot.deliver(
        		recipient: message.sender,
       			message: {
          			text: "Sorry, we couldn't catch that. Try type: zipcode *your 5 digit zipcode*"
        		}
        	)
    	end 
	end

	else
		Bot.deliver(
        	recipient: message.sender,
       		message: {
          		text: "Fuck you Janet."
        	}
        )
    end
end