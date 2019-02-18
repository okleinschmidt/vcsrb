module Vcsrb
  class CloudAssemblyProjects

    include Enumerable

    def initialize(*args)
      @vcsrb = Vcsrb::Client.new
      @uri = "/iaas/api/projects"
    end

    def all
      items = @vcsrb.http_get(@uri)
    end

    def create
      data = {
        "name": "API-TEST",
        "description": "string",
        "administrators": "[{ \"email\":\"ole.kleinschmidt@ottogroup.com\" }]",
        "zoneAssignmentConfigurations": [
          {
            "zoneId": "239c1ec61bfc787557ab017748410",
            "priority": 1,
            "maxNumberInstances": 50
          }
        ]
      }
      @vcsrb.http_post(@uri, data)
    end


    def by_id(id)
      items = @vcsrb.http_get("#{@uri}/#{id}")
    end


  end
end
