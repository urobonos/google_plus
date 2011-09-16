require File.dirname(__FILE__) + '/../spec_helper'

describe GooglePlus::Activity do

  describe :get do

    describe 'when authenticated' do

      before :each do
        GooglePlus.api_key = TEST_API_KEY
      end

      it 'should raise an error with a bad key' do
        lambda do
          GooglePlus.api_key = '123'
          GooglePlus::Person.get(123)
        end.should raise_error GooglePlus::RequestError
      end

      it 'should be able to get a list of activities by person id' do
        acts = GooglePlus::Activity.for_person('105735510282572548726').items
        acts.should_not be_empty
        acts.each { |a| a.should be_a(GooglePlus::Activity) }
      end

      it 'should be able to get an activity by id' do
        acts = GooglePlus::Activity.get('z12dh5o4hzzjujpt423wcvtq2k2igvsl0')
        acts.should be_a(GooglePlus::Activity)
      end

      it 'should be able to get a person from an activity' do
        act = GooglePlus::Activity.get('z12dh5o4hzzjujpt423wcvtq2k2igvsl0')
        act.person.should be_a(GooglePlus::Person)
      end

    end

  end

end
