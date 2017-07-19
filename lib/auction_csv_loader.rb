class AuctionCsvLoader
    def initialize(csv)
        @batch = BatchUpload.new
        @csv = csv[1..-1]
        @csv.reject!(&:blank?)
    end
    def save!
        ActiveRecord::Base.transaction do
            @csv.each { |row| AuctionCSVRow.new(row, @batch).create_listing }
            @batch.save!
        end
    end
    def batch_upload
        @batch
    end
    
end
class AuctionCSVRow
    def initialize( row, batch )
        @row = row
        @batch = batch
    end
    def auction_name
        @row[0]
    end
    def create_or_load_auction
        Auction.find_or_initialize_by( name: auction_name ).tap do |auction|
            auction.attributes = auction_attributes
            auction.save
        end
    end
    alias :auction :create_or_load_auction
    def create_listing
        @batch.listings.build( listing_attributes )
    end
    def auction_attributes
        {
            address: @row[1],
            city:    @row[2],
            state:   @row[3],
            zip:     @row[4],
        }
    end
    def listing_attributes
        {
            vehicle_year:     @row[5],
            make:             @row[6],
            model:            @row[7],
            stock_no:         @row[8],
            winning_bid:      @row[9],
            seller_payout:    @row[10],
            description:      @row[11],
            auction_id:       auction.id
        }
    end


end