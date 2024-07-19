# PCPServerSDK::RedirectPaymentMethodSpecificOutput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_product_id** | **Integer** | &lt;- Payment product identifier - please check product documentation for a full overview of possible values. | [optional] |
| **payment_product840_specific_output** | [**PaymentProduct840SpecificOutput**](PaymentProduct840SpecificOutput.md) |  | [optional] |
| **payment_processing_token** | **String** | ID of the token. This property is populated when the payment was done with a token. | [optional] |
| **reporting_token** | **String** | Token to identify the card in the reporting. | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::RedirectPaymentMethodSpecificOutput.new(
  payment_product_id: 840,
  payment_product840_specific_output: null,
  payment_processing_token: 0ca037cc-9079-4df7-8f6f-f2a3443ee521,
  reporting_token: 12a037cc-833d-8b45-8f6f-11c34171f4e1
)
```

