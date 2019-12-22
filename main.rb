require 'telegram/bot'
require 'dotenv'
require './lib/command_watcher'
require './lib/message_dispatcher'
Dotenv.load

token = ENV['BOT_TOKEN']

loop do
  begin
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        if message&.text && message&.chat&.id
          mdp = MessageDispatcher.new(bot: bot, chat_id: message.chat.id)
          mdp.dispatch CommandWatcher.parse(message.text)
        end
      end
    end
  rescue => e
    puts e.inspect
  end
end
