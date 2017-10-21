class Team < ActiveRecord::Base
  establish_connection :parallel
  self.table_name = 'Teams'
end
