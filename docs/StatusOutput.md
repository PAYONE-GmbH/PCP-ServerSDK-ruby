# PCPServerSDK::StatusOutput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_status** | **String** | * WAITING_FOR_PAYMENT - There does not yet exist a PaymentExecution nor a PaymentInformation for this Checkout. * PAYMENT_NOT_COMPLETED - There exists a PaymentExecution or a PaymentInformation for this Checkout, but all or some part of the total amount is still unpaid. * PAYMENT_COMPLETED - There exists a PaymentExecution or a PaymentInformation for this Checkout and the total amount is fully paid. * NO_PAYMENT - Checkout was created and deleted. No Payment Execution and no other actions can be triggered on the Checkout. | [optional] |
| **is_modifiable** | **Boolean** | Indicates whether the Checkout can still be modified. False if any payment is already in progress, true otherwise. | [optional] |
| **open_amount** | **Integer** | Amount in cents always having 2 decimals. The amount yet to be paid. | [optional] |
| **collected_amount** | **Integer** | Amount in cents always having 2 decimals. The amount that has already been collected. | [optional] |
| **cancelled_amount** | **Integer** | Amount in cents always having 2 decimals. The amount that has already been cancelled. | [optional] |
| **refunded_amount** | **Integer** | Amount in cents always having 2 decimals. Amount that has been collected but was refunded to the customer. | [optional] |
| **chargeback_amount** | **Integer** | Amount in cents always having 2 decimals. Amount that has been collected but was charged back by the customer. | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::StatusOutput.new(
  payment_status: WAITING_FOR_PAYMENT,
  is_modifiable: null,
  open_amount: null,
  collected_amount: null,
  cancelled_amount: null,
  refunded_amount: null,
  chargeback_amount: null
)
```

