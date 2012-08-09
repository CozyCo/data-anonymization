require "spec_helper"

describe DataAnon::Strategy::Field::RandomStringSameLength do

  RandomStringSameLength = DataAnon::Strategy::Field::RandomStringSameLength
  let(:field) {DataAnon::Core::Field.new('string_field','fakeString',1,nil)}

  describe 'anonymized string must not be the same as original string' do
    let(:anonymized_string) {RandomStringSameLength.new().anonymize(field)}

    it {anonymized_string.should_not equal field.value}
  end

  describe 'anonymized string should be the same length as original string' do
    let(:anonymized_string) {RandomStringSameLength.new().anonymize(field)}

    it {anonymized_string.length.should equal field.value.length}
  end

  describe 'anonymized name should have same number of words as original' do

    let(:field) {DataAnon::Core::Field.new('string_field','Fake Longer String Test',1,nil)}
    let(:anonymized_string) {RandomStringSameLength.new().anonymize(field)}

    it {anonymized_string.split(' ').size.should equal field.value.split(' ').size}

  end
end