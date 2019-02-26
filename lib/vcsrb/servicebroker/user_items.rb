module Vcsrb
  class ServiceBroker
    class UserCatalogItems < Vcsrb::Client
      include Enumerable

      def initialize(*args)
        @uri = "/catalog/api/items"
        super
      end

    end
  end
end
