require_relative 'account'
require_relative 'transaction'
require 'terminal-table'

class Statement
  attr_reader :statement, :header

  def initialize
    @header = %w[Date In Out Balance]
    @table = Terminal::Table.new headings: @header
  end

  def new_row(chart_info)
    @table.add_row chart_info
  end

  def display
    print @table
  end
end
