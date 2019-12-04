# cronotab.rb — Crono configuration file
#
# Here you can specify periodic jobs and schedule.
# You can use ActiveJob's jobs from `app/jobs/`
# You can use any class. The only requirement is that
# class should have a method `perform` without arguments.
#
# class TestJob
#   def perform
#     puts 'Test!'
#   end
# end
#
# Crono.perform(TestJob).every 2.days, at: '15:30'
#

require 'rake'
require 'telegram/bot'


# require 'dotenv'
# require './lib/command_watcher'
# require './lib/message_dispatcher'
# Dotenv.load
#
# token = ENV['BOT_TOKEN']
#
# class TestStart
#   def perform
# loop do
#   begin
#     Telegram::Bot::Client.run(token) do |bot|
#       bot.listen do |message|
#         if message&.text && message&.chat&.id
#           mdp = MessageDispatcher.new(bot: bot, chat_id: message.chat.id)
#           mdp.dispatch CommandWatcher.parse(message.text)
#         end
#       end
#     end
#   rescue => e
#     puts e.inspect
#   end
# end
# end
# end


Rails.app_class.load_tasks

class TestHalo
  def perform
    Telegram::Bot::Api.new('381614212:AAHZ1le_iWzO94nxuFmAuuzCv75pxWg0tkA').send_message(chat_id: '-1001453300631', text: 'Halo! 🙏')
  end
end

class Test
  def perform
    Telegram::Bot::Api.new('381614212:AAHZ1le_iWzO94nxuFmAuuzCv75pxWg0tkA').send_message(chat_id: '-378704653', text: 'SU jam 16.00 ya! 🙏')
  end
end

class TestYuk
  def perform
    Telegram::Bot::Api.new('381614212:AAHZ1le_iWzO94nxuFmAuuzCv75pxWg0tkA').send_message(chat_id: '-1001453300631', text: 'Yuk Standup! 🙏')
  end
end

# -378704653
# -1001453300631

# class Test
#   def perform
#     Rake::Task['crono:hello'].invoke
#   end
# end

# Crono.perform(Test).every 5.seconds
#Crono.perform(TestStart)
# Crono.perform(TestHalo).every 1.day, at: {hour: 15, min: 29}
Crono.perform(Test).every 1.day, at: {hour: 15, min: 53}
# Crono.perform(TestYuk).every 1.day, at: {hour: 15, min: 59}
