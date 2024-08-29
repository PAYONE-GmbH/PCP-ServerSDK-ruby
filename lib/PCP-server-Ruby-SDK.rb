# Api
require_relative 'PCP-server-Ruby-SDK/endpoints/base_api_client'
require_relative 'PCP-server-Ruby-SDK/endpoints/checkout_api_client'
require_relative 'PCP-server-Ruby-SDK/endpoints/commerce_case_api_client'
require_relative 'PCP-server-Ruby-SDK/endpoints/order_management_checkout_actions_api_client'
require_relative 'PCP-server-Ruby-SDK/endpoints/payment_execution_api_client'
require_relative 'PCP-server-Ruby-SDK/endpoints/payment_information_api_client'

# Errors
require_relative 'PCP-server-Ruby-SDK/errors/api_error_response_exception'
require_relative 'PCP-server-Ruby-SDK/errors/api_exception'
require_relative 'PCP-server-Ruby-SDK/errors/api_response_retrieval_exception'

# Models
require_relative 'PCP-server-Ruby-SDK/models/api_error'
require_relative 'PCP-server-Ruby-SDK/models/address'
require_relative 'PCP-server-Ruby-SDK/models/address_personal'
require_relative 'PCP-server-Ruby-SDK/models/allowed_payment_actions'
require_relative 'PCP-server-Ruby-SDK/models/amount_of_money'
require_relative 'PCP-server-Ruby-SDK/models/apple_payment_data_token_header_information'
require_relative 'PCP-server-Ruby-SDK/models/apple_payment_data_token_information'
require_relative 'PCP-server-Ruby-SDK/models/authorization_mode'
require_relative 'PCP-server-Ruby-SDK/models/bank_account_information'
require_relative 'PCP-server-Ruby-SDK/models/cancel_item'
require_relative 'PCP-server-Ruby-SDK/models/cancel_payment_request'
require_relative 'PCP-server-Ruby-SDK/models/cancel_payment_response'
require_relative 'PCP-server-Ruby-SDK/models/cancel_request'
require_relative 'PCP-server-Ruby-SDK/models/cancel_response'
require_relative 'PCP-server-Ruby-SDK/models/cancel_type'
require_relative 'PCP-server-Ruby-SDK/models/cancellation_reason'
require_relative 'PCP-server-Ruby-SDK/models/capture_output'
require_relative 'PCP-server-Ruby-SDK/models/capture_payment_request'
require_relative 'PCP-server-Ruby-SDK/models/capture_payment_response'
require_relative 'PCP-server-Ruby-SDK/models/card_fraud_results'
require_relative 'PCP-server-Ruby-SDK/models/card_info'
require_relative 'PCP-server-Ruby-SDK/models/card_payment_details'
require_relative 'PCP-server-Ruby-SDK/models/card_payment_method_specific_input'
require_relative 'PCP-server-Ruby-SDK/models/card_payment_method_specific_output'
require_relative 'PCP-server-Ruby-SDK/models/card_recurrence_details'
require_relative 'PCP-server-Ruby-SDK/models/cart_item_input'
require_relative 'PCP-server-Ruby-SDK/models/cart_item_invoice_data'
require_relative 'PCP-server-Ruby-SDK/models/cart_item_order_status'
require_relative 'PCP-server-Ruby-SDK/models/cart_item_patch'
require_relative 'PCP-server-Ruby-SDK/models/cart_item_result'
require_relative 'PCP-server-Ruby-SDK/models/cart_item_status'
require_relative 'PCP-server-Ruby-SDK/models/checkout_references'
require_relative 'PCP-server-Ruby-SDK/models/checkout_response'
require_relative 'PCP-server-Ruby-SDK/models/checkouts_response'
require_relative 'PCP-server-Ruby-SDK/models/commerce_case_response'
require_relative 'PCP-server-Ruby-SDK/models/company_information'
require_relative 'PCP-server-Ruby-SDK/models/complete_financing_payment_method_specific_input'
require_relative 'PCP-server-Ruby-SDK/models/complete_payment_method_specific_input'
require_relative 'PCP-server-Ruby-SDK/models/complete_payment_request'
require_relative 'PCP-server-Ruby-SDK/models/complete_payment_response'
require_relative 'PCP-server-Ruby-SDK/models/contact_details'
require_relative 'PCP-server-Ruby-SDK/models/create_checkout_request'
require_relative 'PCP-server-Ruby-SDK/models/create_checkout_response'
require_relative 'PCP-server-Ruby-SDK/models/create_commerce_case_request'
require_relative 'PCP-server-Ruby-SDK/models/create_commerce_case_response'
require_relative 'PCP-server-Ruby-SDK/models/create_payment_response'
require_relative 'PCP-server-Ruby-SDK/models/customer'
require_relative 'PCP-server-Ruby-SDK/models/customer_device'
require_relative 'PCP-server-Ruby-SDK/models/deliver_item'
require_relative 'PCP-server-Ruby-SDK/models/deliver_request'
require_relative 'PCP-server-Ruby-SDK/models/deliver_response'
require_relative 'PCP-server-Ruby-SDK/models/deliver_type'
require_relative 'PCP-server-Ruby-SDK/models/delivery_information'
require_relative 'PCP-server-Ruby-SDK/models/error_response'
require_relative 'PCP-server-Ruby-SDK/models/extended_checkout_status'
require_relative 'PCP-server-Ruby-SDK/models/financing_payment_method_specific_input'
require_relative 'PCP-server-Ruby-SDK/models/financing_payment_method_specific_output'
require_relative 'PCP-server-Ruby-SDK/models/installment_option'
require_relative 'PCP-server-Ruby-SDK/models/link_information'
require_relative 'PCP-server-Ruby-SDK/models/mandate_recurrence_type'
require_relative 'PCP-server-Ruby-SDK/models/merchant_action'
require_relative 'PCP-server-Ruby-SDK/models/mobile_payment_method_specific_input'
require_relative 'PCP-server-Ruby-SDK/models/mobile_payment_method_specific_output'
require_relative 'PCP-server-Ruby-SDK/models/order'
require_relative 'PCP-server-Ruby-SDK/models/order_item'
require_relative 'PCP-server-Ruby-SDK/models/order_line_details_input'
require_relative 'PCP-server-Ruby-SDK/models/order_line_details_patch'
require_relative 'PCP-server-Ruby-SDK/models/order_line_details_result'
require_relative 'PCP-server-Ruby-SDK/models/order_request'
require_relative 'PCP-server-Ruby-SDK/models/order_response'
require_relative 'PCP-server-Ruby-SDK/models/order_type'
require_relative 'PCP-server-Ruby-SDK/models/patch_checkout_request'
require_relative 'PCP-server-Ruby-SDK/models/patch_commerce_case_request'
require_relative 'PCP-server-Ruby-SDK/models/payment_channel'
require_relative 'PCP-server-Ruby-SDK/models/payment_creation_output'
require_relative 'PCP-server-Ruby-SDK/models/payment_event'
require_relative 'PCP-server-Ruby-SDK/models/payment_execution'
require_relative 'PCP-server-Ruby-SDK/models/payment_execution_request'
require_relative 'PCP-server-Ruby-SDK/models/payment_execution_specific_input'
require_relative 'PCP-server-Ruby-SDK/models/payment_information_request'
require_relative 'PCP-server-Ruby-SDK/models/payment_information_response'
require_relative 'PCP-server-Ruby-SDK/models/payment_method_specific_input'
require_relative 'PCP-server-Ruby-SDK/models/payment_output'
require_relative 'PCP-server-Ruby-SDK/models/payment_product320_specific_input'
require_relative 'PCP-server-Ruby-SDK/models/payment_product3391_specific_input'
require_relative 'PCP-server-Ruby-SDK/models/payment_product3391_specific_output'
require_relative 'PCP-server-Ruby-SDK/models/payment_product3392_specific_input'
require_relative 'PCP-server-Ruby-SDK/models/payment_product771_specific_output'
require_relative 'PCP-server-Ruby-SDK/models/payment_product840_customer_account'
require_relative 'PCP-server-Ruby-SDK/models/payment_product840_specific_output'
require_relative 'PCP-server-Ruby-SDK/models/payment_references'
require_relative 'PCP-server-Ruby-SDK/models/payment_response'
require_relative 'PCP-server-Ruby-SDK/models/payment_status_output'
require_relative 'PCP-server-Ruby-SDK/models/payment_type'
require_relative 'PCP-server-Ruby-SDK/models/payout_output'
require_relative 'PCP-server-Ruby-SDK/models/payout_response'
require_relative 'PCP-server-Ruby-SDK/models/personal_information'
require_relative 'PCP-server-Ruby-SDK/models/personal_name'
require_relative 'PCP-server-Ruby-SDK/models/positive_amount_of_money'
require_relative 'PCP-server-Ruby-SDK/models/processing_mandate_information'
require_relative 'PCP-server-Ruby-SDK/models/product_type'
require_relative 'PCP-server-Ruby-SDK/models/redirect_data'
require_relative 'PCP-server-Ruby-SDK/models/redirect_payment_method_specific_input'
require_relative 'PCP-server-Ruby-SDK/models/redirect_payment_method_specific_output'
require_relative 'PCP-server-Ruby-SDK/models/redirect_payment_product840_specific_input'
require_relative 'PCP-server-Ruby-SDK/models/redirection_data'
require_relative 'PCP-server-Ruby-SDK/models/references'
require_relative 'PCP-server-Ruby-SDK/models/refund_error_response'
require_relative 'PCP-server-Ruby-SDK/models/refund_output'
require_relative 'PCP-server-Ruby-SDK/models/refund_payment_response'
require_relative 'PCP-server-Ruby-SDK/models/refund_request'
require_relative 'PCP-server-Ruby-SDK/models/return_information'
require_relative 'PCP-server-Ruby-SDK/models/return_item'
require_relative 'PCP-server-Ruby-SDK/models/return_request'
require_relative 'PCP-server-Ruby-SDK/models/return_response'
require_relative 'PCP-server-Ruby-SDK/models/return_type'
require_relative 'PCP-server-Ruby-SDK/models/sepa_direct_debit_payment_method_specific_input'
require_relative 'PCP-server-Ruby-SDK/models/sepa_direct_debit_payment_method_specific_output'
require_relative 'PCP-server-Ruby-SDK/models/sepa_direct_debit_payment_product771_specific_input'
require_relative 'PCP-server-Ruby-SDK/models/shipping'
require_relative 'PCP-server-Ruby-SDK/models/shopping_cart_input'
require_relative 'PCP-server-Ruby-SDK/models/shopping_cart_patch'
require_relative 'PCP-server-Ruby-SDK/models/shopping_cart_result'
require_relative 'PCP-server-Ruby-SDK/models/status_category_value'
require_relative 'PCP-server-Ruby-SDK/models/status_checkout'
require_relative 'PCP-server-Ruby-SDK/models/status_output'
require_relative 'PCP-server-Ruby-SDK/models/status_value'
require_relative 'PCP-server-Ruby-SDK/models/three_d_secure_results'
require_relative 'PCP-server-Ruby-SDK/models/transaction_channel'
require_relative 'PCP-server-Ruby-SDK/models/unscheduled_card_on_file_requestor'
require_relative 'PCP-server-Ruby-SDK/models/unscheduled_card_on_file_sequence_indicator'

# Queries
require_relative 'PCP-server-Ruby-SDK/queries/get_checkouts_query'
require_relative 'PCP-server-Ruby-SDK/queries/get_commerce_cases_query'

# Utils
require_relative 'PCP-server-Ruby-SDK/utils/server_meta_info'

# Common 
require_relative 'PCP-server-Ruby-SDK/communicator_configuration'
require_relative 'PCP-server-Ruby-SDK/request_header_generator'
require_relative 'PCP-server-Ruby-SDK/version'

module PCPServerSDK
  class << self
    # Customize default settings for the SDK using block.
    #   PCPServerSDK.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
