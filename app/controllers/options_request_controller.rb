# frozen_string_literal: true

class OptionsRequestController < ApplicationController
  ACCESS_CONTROL_ALLOW_METHODS = %w[GET OPTIONS PUT DELETE POST].freeze
  ACCESS_CONTROL_ALLOW_HEADERS = %w[Accept Origin Content-Type Authorization].freeze
  ACCESS_CONTROL_MAX_AGE = 86_400

  def preflight
    response.headers['Access-Control-Max-Age'] = ACCESS_CONTROL_MAX_AGE
    response.headers['Access-Control-Allow-Headers'] = ACCESS_CONTROL_ALLOW_HEADERS.join(',')
    response.headers['Access-Control-Allow-Methods'] = ACCESS_CONTROL_ALLOW_METHODS.join(',')
    pp Rails.application.config.front_path
    # response.headers['Access-Control-Allow-Origin'] = Rails.application.config.front_path
    response.headers['Access-Control-Allow-Origin'] = '*'
    head :ok
  end
end
