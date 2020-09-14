# module ActiveRecord 
#   class Base 
#     def self.hello 
#       p "Hey I am from AR: Base"
#     end
# end

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
