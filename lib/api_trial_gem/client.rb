
module ApiTrialGem
  class Client
    def initialize(access_token = nil)
      @access_token = access_token || ENV["APITRIALGEM_ACCESS_TOKEN"]
    end
  end
end