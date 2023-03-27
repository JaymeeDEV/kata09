# Kata09: Back to the Checkout

This repository contains a Ruby implementation of the 'Back to the Checkout' problem.

## Getting Started

These instructions will help you set up the project and run the tests on your local machine.

### Prerequisites

- Ruby 3.1.3 or later

### Installation

1. Clone the repository:

  ```bash
  git clone https://github.com/yourusername/kata09.git
  cd kata09
  ```

2. Running the code:

  ```bash
  ruby main.rb
  ```
  
3. Running the tests:
 
  ```
  ruby test/test_suite.rb
  ```
  
  
### Usage
To use the checkout system in your own code, follow these steps:

  ```
  pricing_rules = {
    "A" => PricingStrategy::SpecialPricing.new(50, 3, 130),
    "B" => PricingStrategy::SpecialPricing.new(30, 2, 45),
    "C" => PricingStrategy::UnitPricing.new(20),
    "D" => PricingStrategy::UnitPricing.new(15)
  }

  co = Checkout.new(pricing_rules)
  co.scan("A")
  co.scan("B")
  co.scan("A")
  co.scan("A")
  co.scan("B")
  co.scan("C")
  price = co.total
  puts "Total price: #{price}"
```

### Adding new pricing strategies
To add a new pricing strategy, follow these steps:

1. Create a new class within the PricingStrategy module and implement the calculate_price(count) method:

  ```
  class MyNewPricingStrategy
    def calculate_price(count)
      # Your pricing logic here
    end
  end
  ```
2. Include the new pricing strategy in the pricing rules hash when creating a new Checkout instance:
  ```
    pricing_rules = {
     # A, B, C, D ...
     "E" => MyNewPricingStrategy.new
    }
  ```
  Refer to the provided solution explanation for more details on implementing new pricing strategies.

 
