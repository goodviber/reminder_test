require 'spec_helper'

describe Rule do
  subject { Rule.new(Rule::NOTICE[:quarterly]) {} }

  describe '#notice' do
    it 'should return notice as value' do
      expect(subject.notice).to eq(1)
    end
  end

  describe 'quarterly_rule method' do
    subject { Rule.quarterly_rule('quarterly', Date.today) }

    it 'should be instance of Rule' do
      expect(subject).to be_a_kind_of(Rule)
    end
  end


end
