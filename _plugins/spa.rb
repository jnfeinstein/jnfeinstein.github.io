module Jekyll
  module SpaFilter
    def spa_url(input)
      "\##{input}"
    end
  end
end

Liquid::Template.register_filter(Jekyll::SpaFilter)
