require 'byebug'

module Jekyll
  module ByeBugFilter
    def run_byebug(input)
      byebug
      input
    end
  end
end

Liquid::Template.register_filter(Jekyll::ByeBugFilter)
