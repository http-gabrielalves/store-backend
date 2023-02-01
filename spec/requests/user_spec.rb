require 'rails_helper'

describe 'Users API', type: :request do
    describe 'GET /users' do
    it 'returns a list of users' do
        FactoryBot.create(:user,  name: 'test', email: 'emai', address: 'address', picture: 'picture')

        get '/api/v1/users'
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body).size).to eq(1)
    end
end

    describe 'POST /users' do
        it 'creates a nw user' do
            expect {
            post '/api/v1/users', params: { user: { name: 'test', email: 'emai', address: 'address', picture: 'picture' } }
            
        }.to change(User, :count).by(1)
            expect(response).to have_http_status(:created)
    end

    it 'does not create a user with invalid params' do
        expect {
            post '/api/v1/users', params: { user: { name: 'test', email: 'emai', address: 'address', picture: '' } }
        }.to change(User, :count).by(0)
        expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'does not create a user with the same email' do
        FactoryBot.create(:user,  name: 'test', email: 'emai', address: 'address', picture: 'picture')
        expect {
            post '/api/v1/users', params: { user: { name: 'test', email: 'emai', address: 'address', picture: 'picture' } }
        }.to change(User, :count).by(0)
        expect(response).to have_http_status(:unprocessable_entity)
    end
    
end

describe 'DELETE /users/:id' do
    it 'deletes a user' do
        user = FactoryBot.create(:user,  name: 'test', email: 'emai', address: 'address', picture: 'picture')
        expect {
            delete "/api/v1/users/#{user.id}"
        }.to change(User, :count).by(-1)
        expect(response).to have_http_status(:no_content)
    end
end

describe 'PUT /users/:id' do
    it 'updates a user' do
        user = FactoryBot.create(:user,  name: 'test', email: 'emai', address: 'address', picture: 'picture')
        put "/api/v1/users/#{user.id}", params: { user: { name: 'test2', email: 'emai2',  address: 'address', picture: 'picture' } }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['name']).to eq('test2')
    end
end

end
