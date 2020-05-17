require "discordrb"
require 'dotenv'
require 'net/http'
require 'date'
require 'json'

Dotenv.load

class DiscordBot
  attr_accessor :bot

  # BOT_CLIENT_ID = Rails.application.credentials.dig(:discord, :crient_id)
  # BOT_TOKEN = Rails.application.credentials.dig(:discord, :token)
  BOT_CLIENT_ID = ENV['DISCORD_CRIENT_ID']
  BOT_TOKEN = ENV['DISCORD_TOKEN']

  def initialize
    @bot = Discordrb::Commands::CommandBot.new(token: BOT_TOKEN, client_id: BOT_CLIENT_ID, prefix: "/")
  end

  def start
    settings

    @bot.run
  end

  def settings
    ### Ping ###
    @bot.command :ping do |event|
      event.send_message("pong！ #{event.user.name}")
    end
  end
end

discord_bot = DiscordBot.new
discord_bot.start
