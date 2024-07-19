# PCPServerSDK::ApplePaymentDataTokenInformation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **version** | **String** | Version information about the payment token. Currently only EC_v1 for ECC-encrypted data is supported. | [optional] |
| **signature** | **String** | Detached PKCS #7 signature, Base64 encoded as string. Signature of the payment and header data. The signature includes the signing certificate, its intermediate CA certificate, and information about the signing algorithm. | [optional] |
| **header** | [**ApplePaymentDataTokenHeaderInformation**](ApplePaymentDataTokenHeaderInformation.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::ApplePaymentDataTokenInformation.new(
  version: EC_V1,
  signature: null,
  header: null
)
```

