# frozen_string_literal: true

require 'rspec'

RSpec.describe Connect::WebService::Client do
  let(:api) do
    described_class.new(
      login: ENV.fetch('CONNECT_LOGIN', 'fake'),
      password: ENV.fetch('CONNECT_PASSWORD', 'fake')
    )
  end
  let(:spec_id) { '3bff3f2f-6c13-4d6a-9b2f-c69543a05ea2' }

  it 'has Connect Soap client api' do
    expect(api).to be_an_instance_of(described_class)
  end

  describe '#specialist_read' do
    it 'returns specialist data with params' do
      VCR.use_cassette('specialist_read') do
        result = api.specialist_read(changed_from: DateTime.new(2023, 12, 1))
        expect(result).to be_an_instance_of(Array)
        expect(result).not_to be_empty
        expect(result[0]).to have_key(:value)
        expect(result[0][:value]).to be_an_instance_of(Array)
        expect(result[0][:value]).not_to be_empty
      end
    end

    it 'returns specialist data' do
      VCR.use_cassette('specialist_read') do
        result = api.specialist_read
        expect(result).to be_an_instance_of(Array)
        expect(result).not_to be_empty
        expect(result[0]).to have_key(:value)
        expect(result[0][:value]).to be_an_instance_of(Array)
        expect(result[0][:value]).not_to be_empty
      end
    end
  end

  describe '#region_read' do
    it 'returns regions data' do
      VCR.use_cassette('region_read') do
        result = api.region_read
        expect(result).to be_an_instance_of(Array)
        expect(result).not_to be_empty
        expect(result[0]).to have_key(:value)
        expect(result[0][:value]).to be_an_instance_of(Array)
        expect(result[0][:value]).not_to be_empty
      end
    end
  end

  describe '#department_read' do
    it 'returns department data with params' do
      VCR.use_cassette('department_read') do
        result = api.department_read(changed_from: DateTime.new(2020, 12, 1))
        expect(result).to be_an_instance_of(Array)
      end
    end

    it 'returns department data' do
      VCR.use_cassette('department_read') do
        result = api.department_read
        expect(result).to be_an_instance_of(Array)
      end
    end
  end

  describe '#specialist_add' do
    it 'adds a specialist' do
      options = {
        name: 'John',
        email: 'john@example.com',
        surname: 'Doe',
        secondary_name: 'Smith',
        password: 'password123',
        post: 'Developer',
        department_id: '123',
        phone: '123-456-7890'
      }
      allow(api).to receive(:specialist_add).with(options)
      api.specialist_add(options)
    end
  end

  describe '#specialist_edit' do
    it 'edit a specialist' do
      options = {
        specialist_id: spec_id,
        name: 'John',
        email: 'john@example.com',
        surname: 'Doe',
        secondary_name: 'Smith',
        password: 'password123',
        post: 'Developer',
        department_id: '123',
        phone: '123-456-7890'
      }
      allow(api).to receive(:specialist_edit).with(options)
      api.specialist_edit(options)
    end
  end

  describe '#get_opened_service_treatments' do
    it 'returns opened service treatments' do
      VCR.use_cassette('get_opened_service_treatments') do
        result = api.get_opened_service_treatments(opened_from: DateTime.new(2024, 2, 26))
        expect(result).to be_an_instance_of(Array)
        expect(result).not_to be_empty
        expect(result[0]).to have_key(:value)
        expect(result[0][:value]).to be_an_instance_of(Array)
        expect(result[0][:value]).not_to be_empty
      end
    end

    it 'returns opened service treatments with specialist as a parameter' do
      VCR.use_cassette('get_opened_service_treatments_with_specialist') do
        result = api.get_opened_service_treatments(opened_from: DateTime.new(2024, 2, 26), specialist_id: spec_id)
        expect(result).to be_an_instance_of(Array)
        expect(result).not_to be_empty
        expect(result[0]).to have_key(:value)
        expect(result[0][:value]).to be_an_instance_of(Array)
        expect(result[0][:value]).not_to be_empty
      end
    end
  end
end
