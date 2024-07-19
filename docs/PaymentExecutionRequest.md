# PCPServerSDK::PaymentExecutionRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_method_specific_input** | [**PaymentMethodSpecificInput**](PaymentMethodSpecificInput.md) |  | [optional] |
| **payment_execution_specific_input** | [**PaymentExecutionSpecificInput**](PaymentExecutionSpecificInput.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PaymentExecutionRequest.new(
  payment_method_specific_input: null,
  payment_execution_specific_input: null
)
```

