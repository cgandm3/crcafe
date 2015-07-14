class CafesController < ApplicationController

  # SHOWS ALL POSTS
  def index
    @cafes = Cafe.all

  #   i = 9
  #   while i < 15     
  #   # @keyword = params[:search]
  # ## VACUUM IS THE GEM USED FOR AMAZON SEARCH API IN RUBY
  #     request = Vacuum.new('US')
  # ## AWS CONFIGURATION. ASSOCIATE_TAG IS A REFERRAL ID IN THE INSTANCE SOMEONE USES MY LINKS
  #     request.configure(
  #     aws_access_key_id: ENV['aws_access_key_id'],
  #     aws_secret_access_key: ENV['aws_secret_access_key'],
  #     associate_tag: ENV['associate_tag']
  #     )

  #     params = {
  #       'SearchIndex' => 'GourmetFood',
  #       'ItemPage' => i,
  #       'Keywords'=> 'costa rican coffee',
  #       'ResponseGroup' => "ItemAttributes,Images,Offers"
  #     }
  # ## DEFINES THE REQUEST RETURN
  #     raw_products = request.item_search(query: params)
  #     hashed_products = raw_products.to_h
  #     @products = hashed_products['ItemSearchResponse']['Items']['Item']
  # #     # Seed Datebase - One-Time Operation
  #     @products.each do |product|
  #     next unless product['Offers']['Offer']
      
  #     Cafe.create([{
  #       mimg: product ['MediumImage']['URL'],
  #        limg: product ['LargeImage']['URL'],  
  #       desc: product['ItemAttributes']['Title'],
  #       feature: product['ItemAttributes']['Feature'],
  #       price: product['Offers']['Offer']['OfferListing']['Price']['Amount'],
  #       fprice: product['Offers']['Offer']['OfferListing']['Price']['FormattedPrice']
  #       }])
  #       end
  #       i += 1
  #     end
    end
  ## THIS ACTION CREATES A POST, ITEMS THAT ARE ASSOCIATED WITH THE POST, AND THE POSTITEM ENTRY.
end
