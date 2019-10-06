require 'bundler'
Bundler.require

module Concerns
end
require_relative '../lib/concerns/findable'
require_all 'lib'



#require_relative '../lib/concerns/findable' 
#any time you make a module you to require relative the file in enivornment so other classes can extend or include the module 