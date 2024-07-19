# PCPServerSDK::MobilePaymentMethodSpecificInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_product_id** | **Integer** | Payment product identifier - please check product documentation for a full overview of possible values. | [optional] |
| **authorization_mode** | [**AuthorizationMode**](AuthorizationMode.md) |  | [optional] |
| **encrypted_payment_data** | **String** | The payment data if we will do the decryption of the encrypted payment data. Typically you&#39;d use encryptedCustomerInput in the root of the create payment request to provide the encrypted payment data instead. | [optional] |
| **public_key_hash** | **String** | Public Key Hash A unique identifier to retrieve key used by Apple to encrypt information. | [optional] |
| **ephemeral_key** | **String** | Ephemeral Key A unique generated key used by Apple to encrypt data. | [optional] |
| **payment_product302_specific_input** | [**PaymentProduct320SpecificInput**](PaymentProduct320SpecificInput.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::MobilePaymentMethodSpecificInput.new(
  payment_product_id: 840,
  authorization_mode: null,
  encrypted_payment_data: null,
  public_key_hash: null,
  ephemeral_key: null,
  payment_product302_specific_input: null
)
```

