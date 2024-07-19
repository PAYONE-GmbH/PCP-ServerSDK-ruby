# PCPServerSDK::PaymentCreationOutput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **external_reference** | **String** | The external reference is an identifier for this transaction and can be used for reconciliation purposes. | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PaymentCreationOutput.new(
  external_reference: C1232O2342
)
```

