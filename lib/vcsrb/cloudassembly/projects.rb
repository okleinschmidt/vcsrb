module Vcsrb
  class CloudAssembly
    class Projects < Vcsrb::Client

      include Enumerable

      def initialize(*args)
        @uri = "/iaas/api/projects"
        super
      end

    end
  end
end
