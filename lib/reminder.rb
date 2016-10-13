class Reminder

  attr_reader :reminder_rules

  def initialize(reminder_rules =[])
    @reminder_rules = reminder_rules
    @results_array = []
  end

  def on(date, estates)
    estates.each do |estate|
      reminder_rules.each do |rule|
        rule.apply(estate.code, estate.period, estate.dates)
      end
    end
  end

end
