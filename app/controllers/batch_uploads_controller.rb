require "csv"

class BatchUploadsController < ApplicationController

    def new
    end

    def create
        csv = CSV.read(params[:csv_file].path)
        csv_loader = AuctionCsvLoader.new( csv )
        if csv_loader.save!
            redirect_to auctions_path
        else
            render :new
        end
    end
end