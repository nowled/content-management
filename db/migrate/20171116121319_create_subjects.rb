class CreateSubjects < ActiveRecord::Migration[5.1]
  def up
    create_table :subjects do |t|
      t.string "name", :limit => 25
      t.integer "position"
      t.boolean "visible"
      

      t.timestamps
    end
    
    
    def down
      
    end 
  end
end
