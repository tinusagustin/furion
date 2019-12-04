def send_answer(message)
  token = '381614212:AAHZ1le_iWzO94nxuFmAuuzCv75pxWg0tkA'
  Telegram::Bot::Client.run(token) do |bot|
    bot.api.send_message(chat_id: message.chat.id, text: "YUK STANDUP!")
  end
end
