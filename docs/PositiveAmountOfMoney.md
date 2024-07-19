# PCPServerSDK::PositiveAmountOfMoney

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount** | **Integer** | Amount in cents and always having 2 decimals |  |
| **currency_code** | **String** | Three-letter ISO currency code representing the currency for the amount |  |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PositiveAmountOfMoney.new(
  amount: 1000,
  currency_code: EUR
)
```

