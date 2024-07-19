# PCPServerSDK::RedirectPaymentProduct840SpecificInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **address_selection_at_pay_pal** | **Boolean** | Indicates whether to use PayPal Express Checkout Shortcut.  * true &#x3D; When shortcut is enabled, the consumer can select a shipping address during PayPal checkout.  * false &#x3D; When shortcut is disabled, the consumer cannot change the shipping address. Default value is false. Please note that this field is ignored when order.additionalInput.typeInformation.purchaseType is set to \&quot;digital\&quot; | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::RedirectPaymentProduct840SpecificInput.new(
  address_selection_at_pay_pal: null
)
```

