# PCPServerSDK::PaymentProduct3391SpecificInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **installment_option_id** | **String** | ID of the selected installment option. Will be provided in the response of the Order / Payment Execution request. |  |
| **bank_account_information** | [**BankAccountInformation**](BankAccountInformation.md) |  |  |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PaymentProduct3391SpecificInput.new(
  installment_option_id: null,
  bank_account_information: null
)
```

