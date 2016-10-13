require 'spec_helper'

describe Reminder do
  EstateStub = Struct.new(:code, :period, :dates)
  subject { Reminder.new }

  describe 'reminding on query date' do
    estates = [ Estate.new('123rt', 'quarterly', ["1 Feb", "4 May", "15 June"]), Estate.new('124rt', 'quarterly', ["10 Feb", "14 May", "25 June"]) ]

    it 'should return estates within date range' do
     expect(subject.on("25 Jan", estates)).to eq(estates)

    end


  end
end
