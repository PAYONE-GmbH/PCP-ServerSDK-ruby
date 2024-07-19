# PCPServerSDK::RefundRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount_of_money** | [**PositiveAmountOfMoney**](PositiveAmountOfMoney.md) |  | [optional] |
| **references** | [**PaymentReferences**](PaymentReferences.md) |  | [optional] |
| **_return** | [**ReturnInformation**](ReturnInformation.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::RefundRequest.new(
  amount_of_money: null,
  references: null,
  _return: null
)
```

