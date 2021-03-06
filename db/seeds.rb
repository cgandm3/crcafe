# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seeding the DB using an API Call from Amazon
i = 1
  while i < 11  
  # @keyword = params[:search]
## VACUUM IS THE GEM USED FOR AMAZON SEARCH API IN RUBY
    request = Vacuum.new('US')
## AWS CONFIGURATION. ASSOCIATE_TAG IS A REFERRAL ID IN THE INSTANCE SOMEONE USES MY LINKS
    request.configure(
    aws_access_key_id: ENV['aws_access_key_id'],
    aws_secret_access_key: ENV['aws_secret_access_key'],
    associate_tag: ENV['associate_tag']
    )

    params = {
      'SearchIndex' => 'GourmetFood',
      'ItemPage' => i,
      'Keywords'=> 'costa rican coffee',
      'ResponseGroup' => "ItemAttributes,Images,Offers"
    }
## DEFINES THE REQUEST RETURN
    raw_products = request.item_search(query: params)
    hashed_products = raw_products.to_h
    @products = hashed_products['ItemSearchResponse']['Items']['Item']
    # raise @products.inspect
#     # Seed Datebase - One-Time Operation
    @products.each do |product|
      
      if product['Offers']['Offer'] != nil 
        if product['MediumImage'] != nil

          #next unless product['Offers']['Offer']
          # next unless product['MediumImage']['URL'] != ""

          # puts "----------------------------------"
          # puts product['ItemAttributes']['Title']
          # puts product['Offers']['Offer']
          # puts product['MediumImage']['URL']
          # puts "--------------------------------------------------------------------------------"

          Cafe.create([{
            mimg: product['MediumImage']['URL'],
            limg: product['LargeImage']['URL'],  
            desc: product['ItemAttributes']['Title'],
            feature: product['ItemAttributes']['Feature'],
            price: product['Offers']['Offer']['OfferListing']['Price']['Amount'],
            fprice: product['Offers']['Offer']['OfferListing']['Price']['FormattedPrice']
            }])
        end
      end
    end
      i += 1
end