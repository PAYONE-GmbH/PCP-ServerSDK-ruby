# PCPServerSDK::PaymentResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_output** | [**PaymentOutput**](PaymentOutput.md) |  | [optional] |
| **status** | [**StatusValue**](StatusValue.md) |  | [optional] |
| **status_output** | [**PaymentStatusOutput**](PaymentStatusOutput.md) |  | [optional] |
| **id** | **String** | Unique payment transaction identifier of the payment gateway. | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PaymentResponse.new(
  payment_output: null,
  status: null,
  status_output: null,
  id: PP1AA7KKLSFB9MBG
)
```

