# frozen_string_literal: true

require 'rspec'

RSpec.describe Connect::HTTPService::Client do
  let(:api) do
    described_class.new(
      login: ENV.fetch('CONNECT_LOGIN', 'fake'),
      password: ENV.fetch('CONNECT_PASSWORD', 'fake')
    )
  end
  let(:user_id) { '47a6720d-c4da-11e5-80e0-0025904f970e' }
  let(:line_id) { 'b55cd510-35dc-11e4-93f8-e839352bba69' }
  let(:spec_id) { '3bff3f2f-6c13-4d6a-9b2f-c69543a05ea2' }
  let(:ticket_id) { '2dc3f2f-1c12-7b6c-0q4x-s69524a05ec3' }
  let(:test_line_id) { 'cd484afc-29b7-11ed-8dca-00505601495b' }
  let(:test_user_id) { 'dd9f0a89-08db-49bf-83dc-dfe3269bf6fe' }
  let(:test_conference_id) { '01397a78-66f1-4987-9db7-f62515534666' }

  it 'has Connect HTTP client api' do
    expect(api).to be_an_instance_of(described_class)
  end

  describe '#get_treatments' do
    it 'returns treatments data with user_id' do
      VCR.use_cassette('get_treatments') do
        result = api.get_treatments
        expect(result).to be_an_instance_of(Array)
        first = result[0]
        expect(first).to have_key('treatment_id')
        expect(first).to have_key('user_id')
        expect(first).to have_key('line_id')
        expect(first).to have_key('initialized_at')
        expect(first).to have_key('current_specialist')
      end
    end

    it 'returns treatments data with line_id' do
      VCR.use_cassette('get_treatments_with_line_id') do
        result = api.get_treatments(line_id: line_id)
        expect(result).to be_an_instance_of(Array)
        first = result[0]
        expect(first).to have_key('treatment_id')
        expect(first).to have_key('user_id')
        expect(first).to have_key('line_id')
        expect(first).to have_key('initialized_at')
        expect(first).to have_key('current_specialist')
      end
    end

    it 'returns treatments data with user_id' do
      VCR.use_cassette('get_treatments_with_user_id') do
        result = api.get_treatments(user_id: user_id)
        expect(result).to be_an_instance_of(Array)
        first = result[0]
        expect(first).to have_key('treatment_id')
        expect(first).to have_key('user_id')
        expect(first).to have_key('line_id')
        expect(first).to have_key('initialized_at')
        expect(first).to have_key('current_specialist')
      end
    end
  end

  describe '#get_subscriber' do
    it 'returns subscriber data' do
      VCR.use_cassette('get_subscriber') do
        result = api.get_subscriber(user_id: user_id)
        expect(result).to be_an_instance_of(Hash)
        expect(result).to have_key('user_id')
        expect(result).to have_key('name')
        expect(result).to have_key('surname')
        expect(result).to have_key('patronymic')
        expect(result).to have_key('avatar_url')
        expect(result).to have_key('post')
        expect(result).to have_key('phone')
        expect(result).to have_key('email')
      end
    end
  end

  describe '#get_subscribers' do
    it 'returns subscriber data' do
      VCR.use_cassette('get_subscribers') do
        result = api.get_subscribers
        expect(result).to be_an_instance_of(Array)
        first = result[0]
        expect(first).to have_key('user_id')
        expect(first).to have_key('name')
        expect(first).to have_key('surname')
        expect(first).to have_key('patronymic')
        expect(first).to have_key('post')
        expect(first).to have_key('phone')
        expect(first).to have_key('email')
      end
    end
  end

  describe '#get_subscriptions' do
    it 'returns subscriptions data with user_id' do
      VCR.use_cassette('get_subscriptions') do
        result = api.get_subscriptions(user_id: user_id)
        expect(result).to be_an_instance_of(Array)
        first = result[0]
        expect(first).to have_key('user_id')
        expect(first).to have_key('line_id')
        expect(first).to have_key('subscription_set')
        expect(first).to have_key('subscription_expire_at')
      end
    end
  end

  describe '#get_lines' do
    it 'returns lines data with user_id' do
      VCR.use_cassette('get_lines') do
        result = api.get_lines
        expect(result).to be_an_instance_of(Array)
        first = result[0]
        expect(first).to have_key('name')
        expect(first).to have_key('line_id')
        expect(first).to have_key('allow_bot')
      end
    end
  end

  describe '#get_specialist' do
    it 'returns empty specialist data' do
      VCR.use_cassette('get_specialist_empty') do
        result = api.get_specialist(user_id: user_id)
        expect(result).to be_an_instance_of(Hash)
        expect(result).to be_empty
      end
    end

    it 'returns specialist data' do
      VCR.use_cassette('get_specialist') do
        result = api.get_specialist(user_id: spec_id)
        expect(result).to be_an_instance_of(Hash)
        expect(result).to have_key('user_id')
        expect(result).to have_key('name')
        expect(result).to have_key('surname')
        expect(result).to have_key('patronymic')
        expect(result).to have_key('post')
        expect(result).to have_key('phone')
        expect(result).to have_key('email')
      end
    end
  end

  describe '#get_specialists' do
    it 'returns specialists data' do
      VCR.use_cassette('get_specialists') do
        result = api.get_specialists
        expect(result).to be_an_instance_of(Array)
        first = result[0]
        expect(first).to have_key('user_id')
        expect(first).to have_key('name')
        expect(first).to have_key('surname')
        expect(first).to have_key('patronymic')
        expect(first).to have_key('post')
        expect(first).to have_key('phone')
        expect(first).to have_key('email')
      end
    end
  end

  describe '#get_specialists_available' do
    it 'returns specialists available data' do
      VCR.use_cassette('get_specialists_available') do
        result = api.get_specialists_available(line_id: line_id)
        expect(result).to be_an_instance_of(Array)
      end
    end
  end

  describe '#get_competences' do
    it 'returns competences data' do
      VCR.use_cassette('get_competences') do
        result = api.get_competences
        expect(result).to be_an_instance_of(Array)
        first = result[0]
        expect(first).to have_key('line_id')
        expect(first).to have_key('specialist_id')
        expect(first).to have_key('pool_priority')
        expect(first).to have_key('is_franch_spec')
      end
    end

    it 'returns competences data' do
      VCR.use_cassette('get_competences_with_user_id') do
        result = api.get_competences(user_id: spec_id)
        expect(result).to be_an_instance_of(Array)
        first = result[0]
        expect(first).to have_key('line_id')
        expect(first).to have_key('specialist_id')
        expect(first).to have_key('pool_priority')
        expect(first).to have_key('is_franch_spec')
      end
    end
  end

  describe '#get_ticket' do
    it 'returns ticket data' do
      VCR.use_cassette('get_ticket') do
        result = api.get_ticket(id: ticket_id)
        expect(result).to be_an_instance_of(Hash)
      end
    end
  end

  describe '#get_ticket_by_number' do
    it 'returns ticket data by number' do
      VCR.use_cassette('get_ticket_by_number') do
        result = api.get_ticket_by_number(number: 1)
        expect(result).to be_an_instance_of(Hash)
      end
    end
  end

  describe '#appoint_start' do
    it 'appoints free specialist and returns error' do
      VCR.use_cassette('appoint_start_error') do
        result = api.appoint_start(line_id: test_line_id, user_id: spec_id)
        expect(result).to be_an_instance_of(Hash)
        expect(result).to have_key('error')
      end
    end

    it 'appoints specialist and returns ok' do
      VCR.use_cassette('appoint_start_ok') do
        result = api.appoint_start(line_id: test_line_id, user_id: test_user_id)
        expect(result).to be_an_instance_of(Hash)
        expect(result).to be_empty
      end
    end
  end

  describe '#appoint_spec' do
    it 'appoints specialist and returns ok' do
      VCR.use_cassette('appoint_spec') do
        result = api.appoint_spec(line_id: test_line_id, user_id: test_user_id, spec_id: spec_id)
        expect(result).to be_an_instance_of(Hash)
        expect(result).to be_empty
      end
    end
  end

  describe '#drop_treatment' do
    it 'drop treatment and returns ok' do
      VCR.use_cassette('drop_treatment') do
        result = api.drop_treatment(line_id: test_line_id, user_id: test_user_id, author_id: spec_id)
        expect(result).to be_an_instance_of(Hash)
        expect(result).to be_empty
      end
    end
  end

  describe '#send_message_line' do
    it 'send message' do
      VCR.use_cassette('send_message_line') do
        result = api.send_message_line(
          line_id: test_line_id,
          user_id: test_user_id,
          author_id: spec_id,
          bot_as_spec: false,
          text: 'test message'
        )
        expect(result).to be_an_instance_of(Hash)
        expect(result).to be_empty
      end
    end
  end

  describe '#drop_keyboard' do
    it 'drop keyboard' do
      VCR.use_cassette('drop_keyboard') do
        result = api.drop_keyboard(
          line_id: test_line_id,
          user_id: test_user_id,
        )
        expect(result).to be_an_instance_of(Hash)
        expect(result).to be_empty
      end
    end
  end

  describe '#send_message_colleague' do
    it 'send message to colleague' do
      VCR.use_cassette('send_message_colleague') do
        result = api.send_message_colleague(
          recepient_id: test_line_id,
          author_id: spec_id,
          text: 'test message'
        )
        expect(result).to be_an_instance_of(Hash)
        expect(result).to be_empty
      end
    end
  end

  describe '#send_message_colleague' do
    it 'send message to conference' do
      VCR.use_cassette('send_message_conference') do
        result = api.send_message_conference(
          conference_id: test_conference_id,
          author_id: spec_id,
          text: 'test message'
        )
        expect(result).to be_an_instance_of(Hash)
        expect(result).to be_empty
      end
    end
  end
end
