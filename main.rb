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
        if message.text
          dispatcher = MessageDispatcher.new(bot: bot, chat_id: message.chat.id)
          if message.text.start_with? '/image'
            image_path = "./images/*"
            images = Dir[image_path]
            dispatcher.send(photo: images.sample)
          elsif message.text.start_with? '/gif'
            image_path = "./gifs/*"
            gifs = Dir[image_path]
            dispatcher.send(gif: gifs.sample)
          elsif message.text.start_with? '/makan2'
          question = 'Mau makan-makan kapan?'
          answers =
            Telegram::Bot::Types::ReplyKeyboardMarkup
            .new(keyboard: [%w(A.sekarang B.besok), %w(C.lusa D.nggakbisasemuanya)], one_time_keyboard: true)
          bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)
          elsif message.text.start_with? '/tidakmakan2'
          kb = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
          bot.api.send_message(chat_id: message.chat.id, text: 'Sorry to see you go :(', reply_markup: kb)
          elsif message&.text && message&.chat&.id
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
