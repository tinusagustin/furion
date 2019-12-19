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
        case message.text
        when '/makan2'
          question = 'Mau makan-makan kapan?'
          # See more: https://core.telegram.org/bots/api#replykeyboardmarkup
          answers =
            Telegram::Bot::Types::ReplyKeyboardMarkup
            .new(keyboard: [%w(A.sekarang B.besok), %w(C.lusa D.nggakbisasemuanya)], one_time_keyboard: true)
          bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)
        when '/tidakmakan2'
          # See more: https://core.telegram.org/bots/api#replykeyboardremove
          kb = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
          bot.api.send_message(chat_id: message.chat.id, text: 'Sorry to see you go :(', reply_markup: kb)
        if message&.text && message&.chat&.id
          mdp = MessageDispatcher.new(bot: bot, chat_id: message.chat.id)
          mdp.dispatch CommandWatcher.parse(message.text)
        end
       end
      end
    end
  rescue => e
    puts e.inspect
  end
end
