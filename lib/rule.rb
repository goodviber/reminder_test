class Rule
  attr_reader :notice
  attr_reader :block

 NOTICE = { quarterly: 1, twice_yearly: 2 }

  def initialize(notice, &block)
    @notice = notice
    @block = block
  end

  def apply(*args)
    block.call(args)
  end

  def self.quarterly_rule(service_period, query_date)
    Rule.new(Rule::NOTICE[:quarterly]) do |code, period, dates|
      if period == service_period
        dates.each do |date|
          if(Date.parse(query_date) >> 1) >= Date.parse(date) && Date.parse(date) >= Date.parse(query_date)
            puts "query date: #{query_date}, Estate code: #{code}, Reminder date: #{date}"
          end
        end
      end
    end
  end

  def self.twice_yearly_rule(service_period, query_date)
    Rule.new(Rule::NOTICE[:twice_yearly]) do |code, period, dates|
      #puts "period #{service_period}, #{query_date} - #{period} - #{dates}"

      if period == service_period
        dates.each do |date|
          if(Date.parse(query_date) >> 2) >= Date.parse(date) && Date.parse(date) >= Date.parse(query_date)
            puts "query date: #{query_date}, Estate code: #{code}, Reminder date: #{date}"
          end
        end
      end
    end
  end

end
