module Vcsrb
  class ServiceBroker
    class AdminCatalogItems < Vcsrb::Client
      include Enumerable

      def initialize(*args)
        @uri = "/catalog/api/admin/items"
        super
      end

    end
  end
end
