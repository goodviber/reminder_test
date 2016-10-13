class Estate
  attr_reader :code, :period, :dates

  def initialize(code, period, dates = [])
    @code = code
    @period = period
    @dates = dates
  end

end
