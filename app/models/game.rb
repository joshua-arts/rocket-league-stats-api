class Game < ActiveRecord::Base
  establish_connection :parallel
  self.table_name = 'Logs'
end
