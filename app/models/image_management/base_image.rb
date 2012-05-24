module ImageManagement
 class BaseImage < ActiveRecord::Base
    has_many :image_versions
    belongs_to :template

    accepts_nested_attributes_for :template

    # def to_xml(options = {})
      # #super options.merge(:methods => [:template])
    # end
  end
end