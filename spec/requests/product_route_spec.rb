require 'rails_helper'


describe "product routes", :type => :request do

  before(:each) do
    
    post '/products', params: { :product => {:name => 'test_name'} }
    @product = Product.find(JSON.parse(response.body)['id'])
    post '/products', params: { :product => {:name => 'test_name2'} }
    @product2 = Product.find(JSON.parse(response.body)['id'])
  end


  it 'returns a created status' do
    post "/products/", params: { :product => {:name => 'test_name3'} }
    expect(response).to have_http_status(:created)
  end

  it 'returns unprocessable entity status when given invalid input' do
    post "/products/", params: { :product => {:name => nil} }
    expect(response).to have_http_status(422)
  end

  it 'deletes a product' do
    delete "/products/#{@product2.id}"
    delete "/products/#{@product.id}"
    get "/products"
    expect(JSON.parse(response.body).length).to eq(0)
  end
  #
  it 'Patches a product' do
    patch "/products/#{@product.id}", params: { :product => {:name => 'updated_test_name'} }
    get "/products/#{@product.id}"
    expect(JSON.parse(response.body)["name"]).to eq("updated_test_name")
  end

  it 'returns unprocessable entity status when given invalid input' do
    patch "/products/#{@product.id}", params: { :product => {:name => nil} }
    expect(response).to have_http_status(422)
  end

  it 'returns all products' do
    get "/products"
    expect(JSON.parse(response.body).first['name']).to eq('test_name')
  end


end
