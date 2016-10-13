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

  describe 'creating rule processor' do
    it 'should call block with no arguments' do
      value = false
      rule = Rule.new(Rule::NOTICE[:quarterly])do
        value = true
      end
      expect(rule.apply).to be_truthy
    end

    it 'should not call block with one argument' do
      rule = Rule.new(Rule::NOTICE[:quarterly]) do |value|
        value
      end
      expect(rule.apply('foo')).not_to eq('foo')
    end

    it 'should call block with two arguments' do
      rule = Rule.new(Rule::NOTICE[:quarterly]) do |value1, value2|
        "#{value1}-#{value2}"
      end
      expect(rule.apply('foo', 'bar')).to eq('foo-bar')
    end

    it 'should call block with three arguments' do
      rule = Rule.new(Rule::NOTICE[:quarterly]) do |value1, value2, value3|
        "#{value1}-#{value2}-#{value3}"
      end
      expect(rule.apply('foo', 'bar', 'baz')).to eq('foo-bar-baz')
    end
  end


end
