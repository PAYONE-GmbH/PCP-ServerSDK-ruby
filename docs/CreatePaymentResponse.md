# PCPServerSDK::CreatePaymentResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **creation_output** | [**PaymentCreationOutput**](PaymentCreationOutput.md) |  | [optional] |
| **merchant_action** | [**MerchantAction**](MerchantAction.md) |  | [optional] |
| **payment** | [**PaymentResponse**](PaymentResponse.md) |  | [optional] |
| **payment_execution_id** | **String** | reference to the paymentExecution. | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CreatePaymentResponse.new(
  creation_output: null,
  merchant_action: null,
  payment: null,
  payment_execution_id: 4f0c512e-f12c-11ec-8ea0-0242ac120002
)
```

