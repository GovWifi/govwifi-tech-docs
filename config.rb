require 'govuk_tech_docs'
require 'kramdown'
require_relative 'lib/middleware/rack/downcase_headers'

GovukTechDocs.configure(self)
set :markdown_engine, :kramdown
set :markdown, input: 'GFM'
set :relative_links, true

# Point the contribution banner's "Report problem" link at the GovWifi support
# inbox (connected to Zendesk) instead of the (broken) default GitHub "new
# issue" URL. The gem reads config[:source_urls][:report_issue_url] and appends
# ?body=...&subject=..., which a mailto: uses to pre-fill the email.
set :source_urls, {
  report_issue_url: "mailto:govwifi-support@digital.cabinet-office.gov.uk"
}

configure :build do
  Middleman::Extensions::MinifyJavascript.config.setting(:compressor).value = proc {
    require 'uglifier'
    Uglifier.new(harmony: true)
  }
  activate :relative_assets
end

configure :development do
  use ::Rack::DowncaseHeaders
end

redirect "set_up/index.html", to: "/set_up.html"
redirect "requirements/index.html", to: "/requirements.html"
