# PCPServerSDK::CardRecurrenceDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **recurring_payment_sequence_indicator** | **String** | * first &#x3D; This transaction is the first of a series of recurring transactions * recurring &#x3D; This transaction is a subsequent transaction in a series of recurring transactions  Note: For any first of a recurring the system will automatically create a token as you will need to use a token for any subsequent recurring transactions. In case a token already exists this is indicated in the response with a value of False for the isNewToken property in the response. | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CardRecurrenceDetails.new(
  recurring_payment_sequence_indicator: null
)
```

