require 'rest-client'
require 'json'

module Vcsrb
  class Client

    include Enumerable

    def initialize(*args)
      @config = Vcsrb::Config.load
      @baseurl = @config['baseurl']
      @api_token = @config['api_token']
      @config[:verify_ssl] = (@config['validate_cert'].nil? or @config['validate_cert'] != false) ? true : false
      login
    end

    def login
      uri = "/iaas/api/login"
      data = {
        :refreshToken => @api_token
      }
      response = post("#{@baseurl}#{uri}", data.to_json, {content_type: :json, accept: :json})
      JSON.parse(response, :symbolize_names => true)
    end

    def auth_header
      auth_header = {"Authorization" => "Bearer #{login[:token]}"}
    end

    def http_get(uri)
      response = get("#{@baseurl}#{uri}", auth_header)
      JSON.parse(response, :symbolize_names => true)
    end

    private

    def get(url, headers={}, &block)
      execute_request(:method => :get, :url => url, :headers => headers, &block)
    end

    def post(url, payload, headers={}, &block)
      execute_request(:method => :post, :url => url, :payload => payload, :headers => headers, &block)
    end

    def put(url, payload, headers={}, &block)
      execute_request(:method => :put, :url => url, :payload => payload, :headers => headers, &block)
    end

    def delete(url, headers={}, &block)
      execute_request(:method => :delete, :url => url, :headers => headers, &block)
    end

    def execute_request(args, &block)
      args[:verify_ssl] = false #@config[:verify_ssl]
      RestClient::Request.execute(args, &block)
    end

  end
end
