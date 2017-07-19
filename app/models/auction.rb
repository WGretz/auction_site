class Auction < ApplicationRecord
    has_many :listings, inverse_of: :auction

    def vehicles_sold
        listings.count
    end

    def profits
        listings.pluck(:winning_bid, :seller_payout).map do |x|
            x[0] - x[1]
        end.inject(0) { |x,y| x+y }
    end
    
    def avg_profit
        (profits / vehicles_sold.to_f).round(2)
    end
end
