module Vcsrb
  class CloudAssemblyProjects

    include Enumerable

    def initialize(*args)
      @vcsrb = Vcsrb::Client.new
      @uri = "/iaas/api/projects"
    end

    def projects_get
      projects = @vcsrb.http_get(@uri)
      JSON.pretty_generate(projects[:content])
    end


  end
end
