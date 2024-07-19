# PCPServerSDK::RefundOutput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount_of_money** | [**AmountOfMoney**](AmountOfMoney.md) |  | [optional] |
| **merchant_parameters** | **String** | It allows you to store additional parameters for the transaction in JSON format. This field must not contain any personal data.  | [optional] |
| **references** | [**PaymentReferences**](PaymentReferences.md) |  | [optional] |
| **payment_method** | **String** | Payment method identifier used by the our payment engine. | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::RefundOutput.new(
  amount_of_money: null,
  merchant_parameters: {&#39;SessionID&#39;:&#39;126548354&#39;,&#39;ShopperID&#39;:&#39;7354131&#39;},
  references: null,
  payment_method: null
)
```

