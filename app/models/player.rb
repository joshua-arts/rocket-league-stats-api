class Player < ActiveRecord::Base
  establish_connection :parallel
  self.table_name = 'Stats'
end
