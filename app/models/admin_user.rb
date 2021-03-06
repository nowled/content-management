class AdminUser < ApplicationRecord
    
    # this was added because in AltUsers migration file we changed
    # the user table name to admin_users so now User model will know where to look for
    # this corresponding table or just rename the file to the new table name:
    # Admin_user
    #self.table_name = "admin_users"
      has_and_belongs_to_many  :pages
      has_many :section_edits
      has_many :sections, :through => :section_edits
    
end
