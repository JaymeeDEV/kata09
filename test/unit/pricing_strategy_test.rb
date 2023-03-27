require_relative '../test_suite'
require_relative '../../pricing_strategy'

class PricingStrategyTest < Minitest::Test
  def test_unit_pricing
    unit_pricing = PricingStrategy::UnitPricing.new(20)
    assert_equal 60, unit_pricing.calculate_price(3)
  end

  def test_special_pricing
    special_pricing = PricingStrategy::SpecialPricing.new(50, 3, 130)
    assert_equal 130, special_pricing.calculate_price(3)
    assert_equal 180, special_pricing.calculate_price(4)
  end
end
