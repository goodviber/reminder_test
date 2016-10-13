require 'spec_helper'

describe Estate do
  subject { Estate.new('123rt', 'Quarterly', ["1st jan", "2nd feb", "3rd march"]) }

  it 'should return estate code' do
    expect(subject.code).to eq('123rt')
  end

  it 'should return period' do
    expect(subject.period).to eq('Quarterly')
  end

  it 'should return dates' do
    expect(subject.dates).to eq(["1st jan", "2nd feb", "3rd march"])
  end

  it 'should include a specific date' do
    expect(subject.dates).to include("1st jan")
  end

end
