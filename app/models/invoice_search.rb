class InvoiceSearch
  attr_reader :date_from, :date_to

  def initialize(params)
    params ||= {}
    @date_from = parsed_date(params[:date_from], 7.days.ago.to_date)
    @date_to = parsed_date(params[:date_to], Date.today)
  end

  def scope
    # Invoice.where('date BETWEEN ? AND ?', @date_from, @date_to)
    Invoice.where(:date => @date_from.beginning_of_day.to_s..@date_to.end_of_day.to_s)
  end

  private

  def parsed_date(date_string, default)
    Date.parse(date_string)
  rescue ArgumentError, TypeError
    default
  end
end