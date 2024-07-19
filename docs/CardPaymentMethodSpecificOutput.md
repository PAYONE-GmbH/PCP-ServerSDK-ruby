# PCPServerSDK::CardPaymentMethodSpecificOutput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_product_id** | **Integer** | Payment product identifier - please check product documentation for a full overview of possible values. | [optional] |
| **authorisation_code** | **String** | Card Authorization code as returned by the acquirer | [optional] |
| **fraud_results** | [**CardFraudResults**](CardFraudResults.md) |  | [optional] |
| **three_d_secure_results** | [**ThreeDSecureResults**](ThreeDSecureResults.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CardPaymentMethodSpecificOutput.new(
  payment_product_id: 840,
  authorisation_code: null,
  fraud_results: null,
  three_d_secure_results: null
)
```

