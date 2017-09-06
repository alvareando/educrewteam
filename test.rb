require 'twilio-ruby'

account_sid = "AC162bba710ef99d4ada4cef81dcb0256b" # Your Account SID from www.twilio.com/console
auth_token = "your_auth_token"   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "+12345678901",    # Replace with your phone number
    from: "+12345678901")  # Replace with your Twilio number

puts message.sid
