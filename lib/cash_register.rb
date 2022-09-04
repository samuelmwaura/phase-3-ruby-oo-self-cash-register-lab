require "pry"
class CashRegister

    attr_accessor :total, :discount, :items, :latest_transaction#sets reader and setter methods for the intance variables
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items=[] #An empty array to hold all the titles later
    end

    def add_item(title,price,quantity=1) #Have to initialize it to 1 and not 0 since there is later mutliplication
        quantity.times do  #As many times as there are instances of the item, shovel it into the the items array
            @items << title
        end
        @latest_transaction = price*quantity
        @total+=(price*quantity)
    end

    def apply_discount
        if @discount > 0           
            discount_off = @total*(@discount/100.to_f)  #calculate and change to float value
            @total-=discount_off.to_i  #Then return an int for the value
           "After the discount, the total comes to $#{@total}."
        else
          "There is no discount to apply."
        end
    end

    def void_last_transaction
         @total-=@latest_transaction
    end
end


cs = CashRegister.new(20)
cs.add_item("book", 5.00, 3)