module Vcsrb
  class CloudAssembly
    class Cloudaccounts < Vcsrb::Client

      include Enumerable

      def initialize(*args)
        @uri = "/iaas/api/cloud-accounts"
        super
      end

    end
  end
end
