module Ext
  module GroupFor
    def self.extended(base)
     if (ActiveRecord::Base.connection.adapter_name == 'PostgreSQL')
       if base.table_exists?
         base.scope :group_for, {:group => base.column_names.map { |col_name| "#{base.table_name}.#{col_name}" }}
       end
     else
       base.scope :group_for, {:group => "#{base.quoted_table_name}.id"}
     end
    end
  end
end