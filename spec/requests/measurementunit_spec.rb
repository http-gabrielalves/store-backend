require 'rails_helper'

RSpec.describe MeasurementUnit, type: :request do
    describe 'GET /measurement_units' do
    it 'returns a list of measurement_units' do
        FactoryBot.create(:measurement_unit,  name: 'test', abbreviation: 't')

        get '/api/v1/measurement_units'
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body).size).to eq(1)
    end
end

    describe 'POST /measurement_units' do
        it 'creates a new measurement_unit' do
            expect {
            post '/api/v1/measurement_units', params: { measurement_unit: { name: 'test', abbreviation: 't' } } 
            
        }.to change(MeasurementUnit, :count).by(1)
            expect(response).to have_http_status(:created)
    end
end

describe 'DELETE /measurement_units/:id' do
    it 'deletes a measurement_unit' do
        measurement_unit = FactoryBot.create(:measurement_unit,  name: 'test', abbreviation: 't')
        expect {
            delete "/api/v1/measurement_units/#{measurement_unit.id}"
        }.to change(MeasurementUnit, :count).by(-1)
        expect(response).to have_http_status(:no_content)
    end
end

describe 'PUT /measurement_units/:id' do
    it 'updates a measurement_unit' do
        measurement_unit = FactoryBot.create(:measurement_unit,  name: 'test', abbreviation: 't')
        put "/api/v1/measurement_units/#{measurement_unit.id}", params: { measurement_unit: { name: 'test2', abbreviation: 't2' } }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['name']).to eq('test2')
    end
end

end


