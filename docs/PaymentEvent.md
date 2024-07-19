# PCPServerSDK::PaymentEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**PaymentType**](PaymentType.md) |  | [optional] |
| **amount_of_money** | [**AmountOfMoney**](AmountOfMoney.md) |  | [optional] |
| **payment_status** | [**StatusValue**](StatusValue.md) |  | [optional] |
| **cancellation_reason** | [**CancellationReason**](CancellationReason.md) |  | [optional] |
| **return_reason** | **String** | Reason of the Refund (e.g. communicated by or to the costumer). | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PaymentEvent.new(
  type: null,
  amount_of_money: null,
  payment_status: null,
  cancellation_reason: null,
  return_reason: Customer complained
)
```

