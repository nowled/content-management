class SubjectsController < ApplicationController
  
  # these 2 are for reading, index, show
  def index
    
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end
  
  # These are the 2 for creating
  def new
    
    @subject = Subject.new(:name => 'Default')
  end
  
  def create
    
  end 

  # These 2 are for editing updating
  def edit
  end
  
  def update
    
  end 
  
  # And Obviously these are for Destroy and Delete
  
  def delete
  end
  
  def destroy
    
  end 
end
