require 'set'


module PCPServerSDK
  module Queries
    class GetCheckoutsQuery
      attr_accessor :offset, :size, :from_date, :to_date,
                    :from_checkout_amount, :to_checkout_amount,
                    :from_open_amount, :to_open_amount,
                    :from_collected_amount, :to_collected_amount,
                    :from_cancelled_amount, :to_cancelled_amount,
                    :from_refund_amount, :to_refund_amount,
                    :from_chargeback_amount, :to_chargeback_amount,
                    :checkout_id, :merchant_reference, :merchant_customer_id,
                    :include_payment_product_id, :include_checkout_status,
                    :include_extended_checkout_status, :include_payment_channel,
                    :payment_reference, :payment_id, :first_name, :surname,
                    :email, :phone_number, :date_of_birth, :company_information
    
      def initialize
        @include_payment_product_id = []
        @include_checkout_status = []
        @include_extended_checkout_status = []
        @include_payment_channel = []
      end
    
      def to_query_map
        query = {}
    
        query['offset'] = @offset.to_s if @offset
        query['size'] = @size.to_s if @size
        query['fromDate'] = @from_date if @from_date
        query['toDate'] = @to_date if @to_date
        query['fromCheckoutAmount'] = @from_checkout_amount.to_s if @from_checkout_amount
        query['toCheckoutAmount'] = @to_checkout_amount.to_s if @to_checkout_amount
        query['fromOpenAmount'] = @from_open_amount.to_s if @from_open_amount
        query['toOpenAmount'] = @to_open_amount.to_s if @to_open_amount
        query['fromCollectedAmount'] = @from_collected_amount.to_s if @from_collected_amount
        query['toCollectedAmount'] = @to_collected_amount.to_s if @to_collected_amount
        query['fromCancelledAmount'] = @from_cancelled_amount.to_s if @from_cancelled_amount
        query['toCancelledAmount'] = @to_cancelled_amount.to_s if @to_cancelled_amount
        query['fromRefundAmount'] = @from_refund_amount.to_s if @from_refund_amount
        query['toRefundAmount'] = @to_refund_amount.to_s if @to_refund_amount
        query['fromChargebackAmount'] = @from_chargeback_amount.to_s if @from_chargeback_amount
        query['toChargebackAmount'] = @to_chargeback_amount.to_s if @to_chargeback_amount
        query['checkoutId'] = @checkout_id if @checkout_id
        query['merchantReference'] = @merchant_reference if @merchant_reference
        query['merchantCustomerId'] = @merchant_customer_id if @merchant_customer_id
        query['includePaymentProductId'] = @include_payment_product_id.join(',') if @include_payment_product_id.any?
        query['includeCheckoutStatus'] = @include_checkout_status.join(',') if @include_checkout_status.any?
        query['includeExtendedCheckoutStatus'] = @include_extended_checkout_status.join(',') if @include_extended_checkout_status.any?
        query['includePaymentChannel'] = @include_payment_channel.join(',') if @include_payment_channel.any?
        query['paymentReference'] = @payment_reference if @payment_reference
        query['paymentId'] = @payment_id if @payment_id
        query['firstName'] = @first_name if @first_name
        query['surname'] = @surname if @surname
        query['email'] = @email if @email
        query['phoneNumber'] = @phone_number if @phone_number
        query['dateOfBirth'] = @date_of_birth if @date_of_birth
        query['companyInformation'] = @company_information if @company_information
    
        query
      end
    end
    
  end
end
