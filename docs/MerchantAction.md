# PCPServerSDK::MerchantAction

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **action_type** | **String** | Action merchants needs to take in the online payment process. Possible values are:   * REDIRECT - The customer needs to be redirected using the details found in redirectData   * SHOW_FORM - The customer needs to be shown a form with the fields found in formFields. You can submit the data entered by the user in a Complete payment request.   * SHOW_INSTRUCTIONS - The customer needs to be shown payment instruction using the details found in showData. Alternatively the instructions can be rendered by us using the instructionsRenderingData   * SHOW_TRANSACTION_RESULTS - The customer needs to be shown the transaction results using the details found in showData. Alternatively the instructions can be rendered by us using the instructionsRenderingData   * MOBILE_THREEDS_CHALLENGE - The customer needs to complete a challenge as part of the 3D Secure authentication inside your mobile app. The details contained in mobileThreeDSecureChallengeParameters need to be provided to the EMVco certified Mobile SDK as a challengeParameters object.   * CALL_THIRD_PARTY - The merchant needs to call a third party using the data found in thirdPartyData | [optional] |
| **redirect_data** | [**RedirectData**](RedirectData.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::MerchantAction.new(
  action_type: REDIRECT,
  redirect_data: null
)
```

