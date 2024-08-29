#!/usr/bin/env ruby

require_relative '../lib/PCP-server-Ruby-SDK.rb'
require_relative 'commerce_case_api_example'

def run
  api_key = ENV['API_KEY']
  api_secret = ENV['API_SECRET']
  merchant_id = ENV['MERCHANT_ID']
  commerce_case_id = ENV['COMMERCE_CASE_ID']
  checkout_id = ENV['CHECKOUT_ID']

  if !api_key || !api_secret || !merchant_id || !commerce_case_id || !checkout_id
    puts 'Please provide API_KEY, API_SECRET, MERCHANT_ID, COMMERCE_CASE_ID and CHECKOUT_ID as environment variables'
    exit(1)
  end

  communicator_configuration = CommunicatorConfiguration.new(
    api_key,
    api_secret,
    'https://api.preprod.commerce.payone.com'
  )

  commerce_case_api_client_example = CommerceCaseApiExample.new(communicator_configuration)

  # commerce_case_api_client_example.run_post_one
  # commerce_case_api_client_example.run_get_all

  commerce_case_api_client_example.run_get_one
  # commerce_case_api_client_example.run_update_one
end

run
