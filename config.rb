require 'govuk_tech_docs'
require 'kramdown'

GovukTechDocs.configure(self)
set :markdown_engine, :kramdown
set :markdown, input: 'GFM'
set :relative_links, true

# Point the contribution banner's "Report problem" link at the GovWifi admin
# help page instead of the (broken) default GitHub "new issue" URL. The gem
# reads config[:source_urls][:report_issue_url] and appends ?body=...&subject=...
set :source_urls, {
  report_issue_url: "https://admin.wifi.service.gov.uk/help"
}

configure :build do
    Middleman::Extensions::MinifyJavascript.config.setting(:compressor).value = proc {
        require 'uglifier'
        Uglifier.new(harmony: true)
    }
    activate :relative_assets
end

redirect "set_up/index.html", to: "/set_up.html"
redirect "requirements/index.html", to: "/requirements.html"