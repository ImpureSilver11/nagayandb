require "discordrb"

class DiscordJob < ApplicationJob
  queue_as :default

  def perform(token, client_id)
    @token = token
    @bot = Discordrb::Commands::CommandBot.new(token: token, client_id: client_id, prefix: "")
    settings
    @bot.run
  end

  private

  def settings
    ### Ping ###
    @bot.command :ping do |event|
      event.send_message("pong！ #{event.user.name}")
    end

    @bot.command 'ながやんガチャ' do |event|
      @image = Image.new.gacha
      event.send_message(@image.title)
      event.send_file(token, File.open(@image.presigned_url, 'r'))
    end
  end
end

DiscordJob.perform_later(
  Rails.application.credentials.dig(:discord, :token),
  Rails.application.credentials.dig(:discord, :crient_id)
)