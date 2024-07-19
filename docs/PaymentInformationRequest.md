# PCPServerSDK::PaymentInformationRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount_of_money** | [**AmountOfMoney**](AmountOfMoney.md) |  |  |
| **type** | [**PaymentType**](PaymentType.md) |  |  |
| **payment_channel** | [**PaymentChannel**](PaymentChannel.md) |  |  |
| **payment_product_id** | **Integer** | Payment method identifier - please check the product documentation for a full overview of possible values. |  |
| **merchant_reference** | **String** | Unique reference of the PaymentInformation. In case of card present transactions, the reference from the ECR or terminal will be used. It is always the reference for external transactions. (e.g. card present payments, cash payments or payments processed by other payment providers).  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PaymentInformationRequest.new(
  amount_of_money: null,
  type: null,
  payment_channel: null,
  payment_product_id: null,
  merchant_reference: 6a891660b8cf16edaeb26f87d86f0b2f
)
```

