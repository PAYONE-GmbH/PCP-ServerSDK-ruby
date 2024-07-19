# PCPServerSDK::PayoutResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payout_output** | [**PayoutOutput**](PayoutOutput.md) |  | [optional] |
| **status** | [**StatusValue**](StatusValue.md) |  | [optional] |
| **status_category** | [**StatusCategoryValue**](StatusCategoryValue.md) |  | [optional] |
| **id** | **String** | Unique payment transaction identifier of the payment gateway. | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PayoutResponse.new(
  payout_output: null,
  status: null,
  status_category: null,
  id: PP1AA7KKLSFB9MBG
)
```

