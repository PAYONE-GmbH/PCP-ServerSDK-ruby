#!/usr/bin/env ruby

require_relative '../lib/PCP-server-Ruby-SDK.rb'
require_relative 'commerce_case_api_example'

def demonstrate_http_client_customization(api_key, api_secret)
  puts "\n=== HTTP Client Customization Examples ==="

  # Example 1: Global HTTP client with custom timeouts
  puts "\n1. Global HTTP client with custom timeouts:"
  custom_http = Net::HTTP.new('api.preprod.commerce.payone.com', 443)
  custom_http.use_ssl = true
  custom_http.read_timeout = 30
  custom_http.open_timeout = 10

  config_with_custom_http = PCPServerSDK::CommunicatorConfiguration.new(
    api_key,
    api_secret,
    'https://api.preprod.commerce.payone.com',
    custom_http
  )

  puts "  - Read timeout: #{config_with_custom_http.http_client.read_timeout}s"
  puts "  - Open timeout: #{config_with_custom_http.http_client.open_timeout}s"

  # Example 2: HTTP client factory with dynamic configuration
  puts "\n2. HTTP client factory with dynamic configuration:"
  http_factory = proc do |uri|
    puts "  - Creating HTTP client for: #{uri.host}:#{uri.port}"
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == 'https'
    http.read_timeout = 60
    http.open_timeout = 15
    http
  end

  config_with_factory = PCPServerSDK::CommunicatorConfiguration.new(
    api_key,
    api_secret,
    'https://api.preprod.commerce.payone.com',
    http_factory
  )

  puts "  - Factory configured for dynamic client creation"

  # Example 3: Client-specific HTTP client
  puts "\n3. Client-specific HTTP client override:"
  client_specific_http = Net::HTTP.new('api.preprod.commerce.payone.com', 443)
  client_specific_http.use_ssl = true
  client_specific_http.read_timeout = 45

  commerce_case_client = PCPServerSDK::Endpoints::CommerceCaseApiClient.new(
    config_with_custom_http,
    client_specific_http
  )

  puts "  - Client-specific timeout: #{commerce_case_client.http_client.read_timeout}s"
  puts "  - This overrides the global configuration"

  # Example 4: Setting HTTP client after initialization
  puts "\n4. Setting HTTP client after initialization:"
  auth_client = PCPServerSDK::Endpoints::AuthenticationApiClient.new(config_with_custom_http)

  post_init_http = Net::HTTP.new('api.preprod.commerce.payone.com', 443)
  post_init_http.use_ssl = true
  post_init_http.read_timeout = 20

  auth_client.http_client = post_init_http
  puts "  - HTTP client set after initialization with #{auth_client.http_client.read_timeout}s timeout"

  puts "\n=== HTTP Client Customization Examples Complete ==="
end

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

  communicator_configuration = PCPServerSDK::CommunicatorConfiguration.new(
    api_key,
    api_secret,
    'https://api.preprod.commerce.payone.com'
  )

  commerce_case_api_client_example = CommerceCaseApiExample.new(communicator_configuration)

  # commerce_case_api_client_example.run_post_one
  # commerce_case_api_client_example.run_get_all

  # commerce_case_api_client_example.run_get_one
  # commerce_case_api_client_example.run_update_one
  commerce_case_api_client_example.run_auth_token_example

  # Demonstrate HTTP client customization
  demonstrate_http_client_customization(api_key, api_secret)
end

run
