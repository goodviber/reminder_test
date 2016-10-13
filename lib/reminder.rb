class Reminder

  attr_reader :reminder_rules

  def initialize(reminder_rules =[])
    @reminder_rules = reminder_rules
  end

  def on(query_date, estates)
    estates.each do |estate|
      reminder_rules.each do |rule|
        rule.apply(estate.code, estate.period, estate.dates)
      end
    end
  end

end
