# PCPServerSDK::CardPaymentDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **masked_card_number** | **String** | Reference to the card of the transaction. | [optional] |
| **payment_processing_token** | **String** | ID of the token. This property is populated when the payment was done with a token. | [optional] |
| **reporting_token** | **String** | Token to identify the card in the reporting. | [optional] |
| **card_authorization_id** | **String** | Identifier for a successful authorization, reversal or refund. Usually provided by the issuer system. Only provided for card payments.  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CardPaymentDetails.new(
  masked_card_number: 672559XXXXXX1108,
  payment_processing_token: 0ca037cc-9079-4df7-8f6f-f2a3443ee521,
  reporting_token: 12a037cc-833d-8b45-8f6f-11c34171f4e1,
  card_authorization_id: 260042
)
```

