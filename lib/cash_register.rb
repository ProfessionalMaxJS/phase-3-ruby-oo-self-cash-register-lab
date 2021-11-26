require 'pry'

class CashRegister
    
    attr_accessor :total, :discount
    
    def initialize(discount=0)
        @total=0;
        @discount=discount
        @all = []
        @item = {}
    end

    def add_item(title, price, quantity=1)
        quantity.times do
        @all.push(title)
        end

        @item[:title] = title
        @item[:price] = price
        @item[:quantity] = quantity

        @total += price*quantity
    end

    def apply_discount
        if discount>0
            @total *= ((100-@discount).to_f/100)
            @total = @total.to_i
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        # binding.pry
        @total -= (@item[:price])*@item[:quantity]
    end

    def items
        @all
    end
# binding.pry
end