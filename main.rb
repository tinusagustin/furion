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
        case message
        when Telegram::Bot::Types::CallbackQuery
          # Here you can handle your callbacks from inline buttons
          if message.data == 'touch'
            bot.api.send_message(chat_id: message.from.id, text: "Don't touch me!")
          end
        when Telegram::Bot::Types::Message
          kb = [
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Go to Google', url: 'https://google.com'),
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Touch me', callback_data: 'touch'),
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Switch to inline', switch_inline_query: 'some text')
          ]
          markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
          bot.api.send_message(chat_id: message.chat.id, text: 'Make a choice', reply_markup: markup)
        end
        case message.text
        when '/aaa'
          question = 'London is a capital of which country?'
          # See more: https://core.telegram.org/bots/api#replykeyboardmarkup
          answers =
            Telegram::Bot::Types::ReplyKeyboardMarkup
            .new(keyboard: [%w(A B), %w(C D)], one_time_keyboard: true)
          bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)
        when '/stop'
          # See more: https://core.telegram.org/bots/api#replykeyboardremove
          kb = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
          bot.api.send_message(chat_id: message.chat.id, text: 'Sorry to see you go :(', reply_markup: kb)
       end
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
