module Vcsrb
  class ServiceBroker
    class AdminItems < Vcsrb::Client
      include Enumerable

      def initialize(*args)
        @uri = "/library/api/admin/items"
        super
      end

    end
  end
end
