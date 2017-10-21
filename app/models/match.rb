class Match < ActiveRecord::Base
  establish_connection :parallel
  self.table_name = 'Matches'
end
