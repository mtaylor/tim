require "image_management/engine"
require "image_factory/image_factory.rb"

# FIXME Remove filter once support for custom XML with nested resources is
# supported.
require "filters/image_management/user_keys_filter"

module ImageManagement
  mattr_accessor :user_class
  mattr_accessor :provider_account_class
  mattr_accessor :provider_type_class
end
