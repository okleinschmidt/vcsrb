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
      headers = {}
      headers["Accept"]        = "application/json"
      headers["Content-Type"]  = "application/json"
      headers["Authorization"] = "Bearer #{login[:token]}"
      headers
    end

    def http_get(uri)
      response = get("#{@baseurl}#{uri}", auth_header)
      JSON.parse(response, :symbolize_names => true)
    end

    def http_post(uri, data)
      response = post("#{@baseurl}#{uri}", data, auth_header)
    end

    def http_patch(uri, data)
      response = patch("#{@baseurl}#{uri}", data, auth_header)
    end

    def http_delete(uri)
      response = delete("#{@baseurl}#{uri}", auth_header)
      JSON.parse(response, :symbolize_names => true)
    end

    def list
      items = http_get(@uri)
    end

    def by_id(id)
     items = http_get("#{@uri}/#{id}")
    end

    def by_name(name)
      items = http_get(@uri)
      items[:content].select { |x| x[:name].eql? name }
    end
    
    def create(data)
      http_post(@uri, data)
    end

    def update(data)
      http_patch(@uri, data)
    end

    def delete(id)
      items = http_delete("#{@uri}/#{id}")
    end

    private

    def get(url, headers={}, &block)
      execute_request(:method => :get, :url => url, :headers => headers, &block)
    end

    def post(url, payload, headers={}, &block)
      execute_request(:method => :post, :url => url, :payload => payload, :headers => headers, &block)
    end

    def patch(url, payload, headers={}, &block)
      execute_request(:method => :patch, :url => url, :payload => payload, :headers => headers, &block)
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
