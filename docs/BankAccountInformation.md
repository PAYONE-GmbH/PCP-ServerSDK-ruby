# PCPServerSDK::BankAccountInformation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **iban** | **String** | IBAN of the end customer&#39;s bank account. The IBAN is the International Bank Account Number. It is an internationally agreed format for the BBAN and includes the ISO country code and two check digits. |  |
| **account_holder** | **String** | Account holder of the bank account with the given IBAN. Does not necessarily have to be the end customer (e.g. joint accounts). |  |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::BankAccountInformation.new(
  iban: DE02370502990000684712,
  account_holder: Max Mustermann
)
```

