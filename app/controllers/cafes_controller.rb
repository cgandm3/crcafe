class CafesController < ApplicationController

  ## SHOWS ALL POSTS
  def index

    @keyword = params[:search]
  ## VACUUM IS THE GEM USED FOR AMAZON SEARCH API IN RUBY
      request = Vacuum.new('US')
  ## AWS CONFIGURATION. ASSOCIATE_TAG IS A REFERRAL ID IN THE INSTANCE SOMEONE USES MY LINKS
      request.configure(
      aws_access_key_id: ENV['aws_access_key_id'],
      aws_secret_access_key: ENV['aws_secret_access_key'],
      associate_tag: ENV['associate_tag']
      )

      params = {
        'SearchIndex' => 'All',
        'Keywords'=> @keyword,
        'ResponseGroup' => "ItemAttributes,Images"
      }
  ## DEFINES THE REQUEST RETURN
      raw_products = request.item_search(query: params)
      hashed_products = raw_products.to_h
  ## PUTS SPECIFICS OF HASHED SEARCH RESPONSE INTO AN ARRAY
      @products = hashed_products['ItemSearchResponse']['Items']['Item']

  end
  ## THIS ACTION CREATES A POST, ITEMS THAT ARE ASSOCIATED WITH THE POST, AND THE POSTITEM ENTRY.

 @products.each do |product|
  Product.find_or_create_by
    (img: product ['MediumImage']['URL'], 
    desc: product['ItemAttributes']['Title'],
    price: product)['Offers']['Offer']['OfferListing']['Price']['FormattedPrice']
  end

end
