require 'rails_helper'

describe 'Products API', type: :request do
    describe 'GET /products' do
    it 'returns a list of products' do
        FactoryBot.create(:product,  name: 'test', image: 'image1', description: 'description1', category: 'category1', unit: 'kg', stocked: 1, price: 1.0)

        get '/api/v1/products'
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body).size).to eq(1)
    end
end

    describe 'POST /products' do
        it 'creates a nw product' do
            expect {
            post '/api/v1/products', params: { product: { name: 'test', image: 'image1', description: 'description1', category: 'category1', unit: 'kg', stocked: 1, price: 1.0 } } 
            
        }.to change(Product, :count).by(1)
            expect(response).to have_http_status(:created)
    end
end

describe 'DELETE /products/:id' do
    it 'deletes a product' do
        product = FactoryBot.create(:product,  name: 'test', image: 'image1', description: 'description1', category: 'category1', unit: 'kg', stocked: 1, price: 1.0)
        expect {
            delete "/api/v1/products/#{product.id}"
        }.to change(Product, :count).by(-1)
        expect(response).to have_http_status(:no_content)
    end
end

describe 'PUT /products/:id' do
    it 'updates a product' do
        product = FactoryBot.create(:product,  name: 'test', image: 'image1', description: 'description1', category: 'category1', unit: 'kg', stocked: 1, price: 1.0)
        put "/api/v1/products/#{product.id}", params: { product: { name: 'test2', image: 'image2', description: 'description2', category: 'category2', unit: 'kg', stocked: 1, price: 1.0 } }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['name']).to eq('test2')
    end
end

end