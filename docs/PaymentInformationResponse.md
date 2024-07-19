# PCPServerSDK::PaymentInformationResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **commerce_case_id** | **String** | Unique ID of the Commerce Case. | [optional] |
| **checkout_id** | **String** | Unique ID of the Commerce Case. | [optional] |
| **merchant_customer_id** | **String** | Unique identifier of the customer. | [optional] |
| **payment_information_id** | **String** | Unique ID of the Payment Information. | [optional] |
| **payment_channel** | [**PaymentChannel**](PaymentChannel.md) |  | [optional] |
| **payment_product_id** | **Integer** | Payment product identifier - please check see product documentation for a full overview of possible values. | [optional] |
| **terminal_id** | **String** | Unique identifier of the POS terminal of the payment transaction. | [optional] |
| **card_acceptor_id** | **String** | Unique ID that identifies a store location or transaction point and which refers to the contract number of the merchant accepting the card. | [optional] |
| **merchant_reference** | **String** | Unique reference of the PaymentInformation. In case of card present transactions, the reference from the ECR or terminal will be used. It is always the reference for external transactions. (e.g. card present payments, cash payments or payments processed by other payment providers).  | [optional] |
| **card_payment_details** | [**CardPaymentDetails**](CardPaymentDetails.md) |  | [optional] |
| **events** | [**Array&lt;PaymentEvent&gt;**](PaymentEvent.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PaymentInformationResponse.new(
  commerce_case_id: 4f0c512e-f12c-11ec-8ea0-0242ac120002,
  checkout_id: 4f0c512e-f12c-11ec-8ea0-0242ac120002,
  merchant_customer_id: 1234,
  payment_information_id: 637ef15b-1a0a-48f2-27d8-c954a344329c,
  payment_channel: null,
  payment_product_id: 840,
  terminal_id: 60023723,
  card_acceptor_id: 455600217015,
  merchant_reference: 6a891660b8cf16edaeb26f87d86f0b2f,
  card_payment_details: null,
  events: null
)
```

