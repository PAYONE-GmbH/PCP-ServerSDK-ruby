class GetCommerceCasesQuery
  attr_accessor :offset, :size, :from_date, :to_date,
                :commerce_case_id, :merchant_reference, :merchant_customer_id,
                :include_checkout_status, :include_payment_channel

  def initialize
    @include_checkout_status = []
    @include_payment_channel = []
  end

  def set_offset(offset)
    @offset = offset
    self
  end

  def set_size(size)
    @size = size
    self
  end

  def set_from_date(from_date)
    @from_date = from_date
    self
  end

  def set_to_date(to_date)
    @to_date = to_date
    self
  end

  def set_commerce_case_id(commerce_case_id)
    @commerce_case_id = commerce_case_id
    self
  end

  def set_merchant_reference(merchant_reference)
    @merchant_reference = merchant_reference
    self
  end

  def set_merchant_customer_id(merchant_customer_id)
    @merchant_customer_id = merchant_customer_id
    self
  end

  def set_include_checkout_status(include_checkout_status)
    @include_checkout_status = include_checkout_status
    self
  end

  def set_include_payment_channel(include_payment_channel)
    @include_payment_channel = include_payment_channel
    self
  end

  def to_query_map
    query = {}

    query['offset'] = @offset.to_s if @offset
    query['size'] = @size.to_s if @size
    query['fromDate'] = @from_date if @from_date
    query['toDate'] = @to_date if @to_date
    query['commerceCaseId'] = @commerce_case_id if @commerce_case_id
    query['merchantReference'] = @merchant_reference if @merchant_reference
    query['merchantCustomerId'] = @merchant_customer_id if @merchant_customer_id
    query['includeCheckoutStatus'] = @include_checkout_status.join(',') if @include_checkout_status.any?
    query['includePaymentChannel'] = @include_payment_channel.join(',') if @include_payment_channel.any?

    query
  end
end
