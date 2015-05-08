require 'byebug'
require 'escape_utils'

module Jekyll

  class Site
    alias_method :__orig_process, :process

    def process
      __orig_process
      write_templates
    end

    private

    def write_templates
      File.open(File.join(config["destination"], 'js', 'templates.js'), 'w') do |f|
        f.write( AngularTemplates.new(pages).run )
      end
    end
  end

  class AngularTemplates

    def initialize(pages)
      @pages = pages
    end

    def run
      header + @pages.map{ |page| template(page) }.join("\n")
    end

    private

    def header
      <<-EOF
        angular.module('templates', [])
      EOF
    end

    def template(page)
      <<-EOF
        .run(function($templateCache) {
          $templateCache.put(
            "#{EscapeUtils.escape_javascript page.url}",
            "#{EscapeUtils.escape_javascript page.output}"
          );
        })
      EOF
    end

  end

end
