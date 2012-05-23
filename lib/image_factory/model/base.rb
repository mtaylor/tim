module ImageManagement
  module ImageFactory
    class Base < ActiveResource::Base
      self.site = "http://localhost:3000/"
      self.format = :json
    end
  end
end