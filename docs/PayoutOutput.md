# PCPServerSDK::PayoutOutput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount_of_money** | [**AmountOfMoney**](AmountOfMoney.md) |  | [optional] |
| **references** | [**PaymentReferences**](PaymentReferences.md) |  | [optional] |
| **payment_method** | **String** | Payment method identifier based on the paymentProductId. | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PayoutOutput.new(
  amount_of_money: null,
  references: null,
  payment_method: null
)
```

