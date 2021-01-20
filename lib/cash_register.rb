require 'pry'

class CashRegister

    attr_accessor :total, :discount

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @cart=[]
    end

    def add_item(title, price, num=1)
        items={}
        items[:name] = title
        items[:price] = price
        items[:quantity] = num

        @last_title = title
        @last_price = price
        @last_quantity = num

        @cart << items


        @total += price * num
    end

    def void_last_transaction
        @total -= @last_price * @last_quantity
    end
        

    def apply_discount
        if @discount != 0
          discount = 100 - @discount
          @total = @total * discount
          @total = @total / 100
          return "After the discount, the total comes to $#{total}."
        else
          return "There is no discount to apply."
        end
    end

    def items
        item_names = []
        @cart.each do | item_info |
          for qty in 1..item_info[:quantity] 
            item_names << item_info[:name]
          end 
        end 
        item_names
      end 

end




