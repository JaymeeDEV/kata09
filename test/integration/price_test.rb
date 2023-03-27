require_relative '../test_suite'
require_relative '../../pricing_strategy'
require_relative '../../checkout'

class TestPrice < Minitest::Test
  def setup
    @pricing_rules = {
      "A" => PricingStrategy::SpecialPricing.new(50, 3, 130),
      "B" => PricingStrategy::SpecialPricing.new(30, 2, 45),
      "C" => PricingStrategy::UnitPricing.new(20),
      "D" => PricingStrategy::UnitPricing.new(15)
    }
  end

  def price(goods)
    co = Checkout.new(@pricing_rules)
    goods.split(//).each { |item| co.scan(item) }
    co.total
  end

  def test_totals
    assert_equal(0, price(""))
    assert_equal(50, price("A"))
    assert_equal(80, price("AB"))
    assert_equal(115, price("CDBA"))

    assert_equal(100, price("AA"))
    assert_equal(130, price("AAA"))
    assert_equal(180, price("AAAA"))
    assert_equal(230, price("AAAAA"))
    assert_equal(260, price("AAAAAA"))

    assert_equal(160, price("AAAB"))
    assert_equal(175, price("AAABB"))
    assert_equal(190, price("AAABBD"))
    assert_equal(190, price("DABABA"))
  end

  def test_incremental
    co = Checkout.new(@pricing_rules)
    assert_equal(0, co.total)

    co.scan("A"); assert_equal(50, co.total)
    co.scan("B"); assert_equal(80, co.total)
    co.scan("A"); assert_equal(130, co.total)
    co.scan("A"); assert_equal(160, co.total)
    co.scan("B"); assert_equal(175, co.total)
  end
end
