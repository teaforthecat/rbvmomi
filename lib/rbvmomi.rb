require "rbvmomi/version"
module RbVmomi

  # @private
  # @deprecated Use +RbVmomi::VIM.connect+.
  def self.connect opts
    VIM.connect opts
  end

end
require 'rbvmomi/connection'
require 'rbvmomi/vim'
