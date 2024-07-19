# PCPServerSDK::CapturePaymentRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount** | **Integer** | Here you can specify the amount that you want to capture (specified in cents, where single digit currencies are presumed to have 2 digits). The amount can be lower than the amount that was authorized, but not higher.   If left empty, the full amount will be captured and the request will be final.   If the full amount is captured, the request will also be final. | [optional] |
| **is_final** | **Boolean** | This property indicates whether this will be the final operation.  If the full amount should not captured but the property is set to true, the remaining amount will automatically be cancelled.  | [optional][default to false] |
| **cancellation_reason** | [**CancellationReason**](CancellationReason.md) |  | [optional] |
| **references** | [**PaymentReferences**](PaymentReferences.md) |  | [optional] |
| **delivery** | [**DeliveryInformation**](DeliveryInformation.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CapturePaymentRequest.new(
  amount: null,
  is_final: null,
  cancellation_reason: null,
  references: null,
  delivery: null
)
```

