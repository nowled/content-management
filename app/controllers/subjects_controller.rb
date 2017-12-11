class SubjectsController < ApplicationController
  
          layout 'admin'
  
  # these 2 are for reading, index, show
  def index
    
    @subjects = Subject.sorted
    
  end

  def show
    @subject = Subject.find(params[:id])
  end
  
  # These are the 2 for creating They Don't need Ids because 
  # Because records have not been created yet
  def new
    
    @subject = Subject.new(:name => 'Default')
    @subject_count = Subject.count + 1
  end
  
  def create
    # instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    
    #save the object
    if @subject.save
      
      # if Subject save redirect to the index action
      flash[:notice] = "Your Shit Was Saved Successfully"
      redirect_to(subjects_path)
    else
      #if save fails redisplay the form so the user can fix the problems
      @subject_count = Subject.count + 1
      render('new')
    end 
  end 

  # These 2 are for editing updating they need IDs
  def edit
    
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end
  
  def update
     #find a new object with params
     @subject = Subject.find(params[:id])
       #We use the private method below for mass assignments
       flash[:notice] = "Your Shit Was Updated Successfully"
    if @subject.update_attributes(subject_params)
      #redirect to the show page
      redirect_to(subject_path(@subject))
    else
      @subject_count = Subject.count
      render('edit')
    end 
    
  end 
  
  # And Obviously these are for Destroy and Delete
  
  def delete
    @subject = Subject.find(params[:id])
  end
  
  def destroy
    
     @subject = Subject.find(params[:id])
     
     @subject.destroy
     flash[:notice] = "The '#{@subject.name}' Was Destroyed Including Everything In It's Path"
     redirect_to(subjects_path)
    
  end 
  
  private
  
  def subject_params
    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end 
end
