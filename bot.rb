require 'telegram/bot'
require File.dirname(__FILE__) + '/response_logic.rb'

token = '381614212:AAHZ1le_iWzO94nxuFmAuuzCv75pxWg0tkA'

# require 'telegram_bot'
#
# bot = TelegramBot.new(token: token)
#
# bot.get_updates(fail_silently: true) do |message|
#   puts "@#{message.from.username}: #{message.text}"
#   command = message.get_command_for(bot)
#
#   message.reply do |reply|
#     case command
#     when /start/i
#       reply.text = "All I can do is say hello. Try the /greet command. hehe"
#     when /greet/i
#       reply.text = "Hello, #{message.from.first_name}."
#     else
#       reply.text = "I have no idea what #{command.inspect} means."
#     end
#     puts "sending #{reply.text.inspect} to @#{message.from.username}"
#     reply.send_with(bot)
#   end
# end

Telegram::Bot::Client.run(token) do |bot|
  logger = Logger.new('logfile.log')
  bot.listen do |message|
    begin
    @keyword = message.text[/\/([a-zA-Z]+)/]
    rescue => err
      log.fatal(err)
      log.fatal(message.text)
    else
    case @keyword
      when '/start'
        bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
      when '/set'
        @reply = form_response_set(message)
        bot.api.send_message(chat_id: message.chat.id, text: @reply)
      when '/stop'
        bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
      when '/standup'
        bot.api.send_message(chat_id: message.chat.id, text: "STAND UP mulai jam 16.00, #{message.from.first_name}")
    end
    end


  end

end
