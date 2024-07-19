# PCPServerSDK::PaymentProduct840CustomerAccount

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **company_name** | **String** | Name of the company in case the PayPal account is owned by a business | [optional] |
| **first_name** | **String** | First name of the PayPal account holder | [optional] |
| **payer_id** | **String** | The unique identifier of a PayPal account and will never change in the life cycle of a PayPal account. | [optional] |
| **surname** | **String** | Surname of the PayPal account holder | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PaymentProduct840CustomerAccount.new(
  company_name: Customer Company Name,
  first_name: John,
  payer_id: RRCYJUTFJGZTA,
  surname: Doe
)
```

