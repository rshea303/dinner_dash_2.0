module StaticPagesHelper
  def formatted_price(amount)
    number_to_currency(amount/100, precision: 2)
  end
end
