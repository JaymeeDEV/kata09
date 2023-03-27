class Checkout
  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @scanned_items = Hash.new(0)
  end

  def scan(item)
    @scanned_items[item] += 1
  end

  def total
    @scanned_items.inject(0) do |sum, (item, count)|
      pricing_strategy = @pricing_rules[item]
      sum + pricing_strategy.calculate_price(count)
    end
  end
end
