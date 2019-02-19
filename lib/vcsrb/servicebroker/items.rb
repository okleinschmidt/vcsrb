module Vcsrb
  class ServiceBroker
    class Items

      include Enumerable

      def initialize(*args)
        @vcsrb = Vcsrb::Client.new
        @uri = "/library/api/items"
      end

      def list
        items = @vcsrb.http_get(@uri)
      end

      def request(id, data)
        data = {
          "reason": "string",
          "deploymentName": "string",
          "projectId": "string",
          "inputs": {}
        }
        @vcsrb.http_post("#{@uri}/#{id}/request", data)
      end

      def update
        @vcsrb.http_patch(@uri, data)
      end

      def by_id(id)
        items = @vcsrb.http_get("#{@uri}/#{id}")
      end

    end
  end
end
