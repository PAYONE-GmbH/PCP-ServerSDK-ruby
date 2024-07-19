# PCPServerSDK::SepaDirectDebitPaymentProduct771SpecificInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **existing_unique_mandate_reference** | **String** | The unique reference of the existing mandate to use in this payment. | [optional] |
| **mandate** | [**ProcessingMandateInformation**](ProcessingMandateInformation.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::SepaDirectDebitPaymentProduct771SpecificInput.new(
  existing_unique_mandate_reference: exampleMandateReference,
  mandate: null
)
```

