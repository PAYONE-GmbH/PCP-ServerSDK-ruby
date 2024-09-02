require_relative '../lib/PCP-server-Ruby-SDK.rb'
class CommerceCaseApiExample
  attr_accessor :client, :merchant_id, :commerce_case_id

  def initialize(config)
    @client = PCPServerSDK::Endpoints::CommerceCaseApiClient.new(config)
    @merchant_id = ENV['MERCHANT_ID']
    @commerce_case_id = ENV['COMMERCE_CASE_ID']
  end

  def run_post_one
    payload = {}
    res = @client.create_commerce_case_request(@merchant_id, payload)
    
    puts JSON.pretty_generate(res)
  end

  def run_get_all
    query = GetCommerceCasesQuery.new
    query.set_offset(2)
    query.set_size(2)
    puts query
  
    res = @client.get_commerce_cases_request(@merchant_id, query)
    puts res[0].class
    # puts JSON.pretty_generate(res)
  end

  def run_get_one
    res = @client.get_commerce_case_request(@merchant_id, @commerce_case_id)
    puts res.customer.billing_address.house_number

    # puts JSON.pretty_generate(res)
  end

  def run_update_one
    get_one_response = @client.get_commerce_case_request(@merchant_id, @commerce_case_id)

    raise 'Customer not found' unless get_one_response.customer
    raise 'Billing address not found' unless get_one_response.customer.billing_address

    modified_customer = get_one_response.customer.dup
    modified_customer.billing_address.city = 'New York'

    res = @client.update_commerce_case_request(@merchant_id, @commerce_case_id, modified_customer)
    
    puts JSON.pretty_generate(res)
  end
end
