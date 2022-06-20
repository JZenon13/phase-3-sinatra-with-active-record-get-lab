class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries = Bakery.all 
    bakeries.to_json
  end


get '/bakeries/:id' do
  bakery = Bakery.find(params[:id])

  bakery.to_json(
    include: :baked_goods
  )
  end

  get '/baked_goods/by_price' do
    bakery = BakedGood.all.sort_by {|p| p[:price]}.reverse!
    bakery.to_json
    end

    get '/baked_goods/most_expensive' do
      
      bakery = BakedGood.all.order(:price)[-1]
      bakery.to_json
      end
end