module Vcsrb
  class ServiceBroker
    class Entitlements < Vcsrb::Client
      include Enumerable

      def initialize(*args)
        @uri = "/catalog/api/admin/entitlements"
        super
      end

      def list(id)
        items = http_get("#{@uri}?projectId=#{id}")
      end

    end
  end
end
