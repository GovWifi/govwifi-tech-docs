require 'govuk_tech_docs'
require 'kramdown'

GovukTechDocs.configure(self)
set :markdown_engine, :kramdown
set :relative_links, true

configure :build do
    Middleman::Extensions::MinifyJavascript.config.setting(:compressor).value = proc {
        require 'uglifier'
        Uglifier.new(harmony: true)
    }
    activate :relative_assets
end

redirect "set_up/index.html", to: "/set_up.html"
redirect "requirements/index.html", to: "/requirements.html"