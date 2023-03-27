require_relative 'checkout'
require_relative 'pricing_strategy'

pricing_rules = {
  "A" => PricingStrategy::SpecialPricing.new(50, 3, 130),
  "B" => PricingStrategy::SpecialPricing.new(30, 2, 45),
  "C" => PricingStrategy::UnitPricing.new(20),
  "D" => PricingStrategy::UnitPricing.new(15)
}

# Example usage
co = Checkout.new(pricing_rules)
co.scan("A")
co.scan("B")
co.scan("A")
co.scan("A")
co.scan("B")
co.scan("C")
price = co.total
puts "Total price: #{price}"
