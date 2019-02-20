module Vcsrb
  class ServiceBroker
    class UserItems < Vcsrb::Client
      include Enumerable

      def initialize(*args)
        @uri = "/library/api/items"
        super
      end

    end
  end
end
