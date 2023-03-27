module PricingStrategy
  class UnitPricing
    def initialize(unit_price)
      @unit_price = unit_price
    end

    def calculate_price(count)
      @unit_price * count
    end
  end

  class SpecialPricing
    def initialize(unit_price, quantity, special_price)
      @unit_price = unit_price
      @quantity = quantity
      @special_price = special_price
    end

    def calculate_price(count)
      (count / @quantity) * @special_price + (count % @quantity) * @unit_price
    end
  end
end
