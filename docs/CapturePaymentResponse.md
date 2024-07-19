# PCPServerSDK::CapturePaymentResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **capture_output** | [**CaptureOutput**](CaptureOutput.md) |  | [optional] |
| **status** | [**StatusValue**](StatusValue.md) |  | [optional] |
| **status_output** | [**PaymentStatusOutput**](PaymentStatusOutput.md) |  | [optional] |
| **id** | **String** | Unique payment transaction identifier of the payment gateway. | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CapturePaymentResponse.new(
  capture_output: null,
  status: null,
  status_output: null,
  id: 3066019730_1
)
```

