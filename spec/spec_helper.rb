require 'net/https'
require 'nokogiri'

require './config'

module Helpers
  def get path, headers={}
    ssl = headers.delete(:ssl)
    port = headers.delete(:port)

    # path must be absolute
    http = Net::HTTP.new(HOST, port || (ssl ? 443 : 80))
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.use_ssl = ssl
    request = Net::HTTP::Get.new(path, headers)
    http.request(request)
  end

  def document body
    Nokogiri::HTML(body)
  end

  # todo: should rewrite this as an expectation
  def ensure_redirect response, url_matcher
    expect(response.code).to eq('301').or eq('302')
    expect(response.header['location']).to match url_matcher
    # href = document(response.body).css('a').attr('href').value
    # expect(href).to match url_matcher
    response.header['location']
  end
end


RSpec.configure do |config|
  config.include Helpers

  config.expect_with :rspec do |c|
    c.syntax = :expect
    c.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end
