class SectionsController < ApplicationController
  def index
    
    @sections  = Section.sorted
  end

  def show
    
    @section = Section.find(params[:id])
  end

  def new
    
    @section = Section.new 
  end
  
  def create
    @section = Section.new(section_params)
     flash[:notice] = "Successfully Created A New Record"
     if @section.save
       redirect_to(sections_path)
     else
       render('new')
     end 
  end

  def update
    @section = Section.find(params[:id])
    flash[:notice] = "You have successfully updated all this shit"
    if @section.update_attributes(section_params)
      redirect_to(section_path(@section))
    else
      render('edit')
    end
  end 


  def edit
    @section = Section.find(params[:id])
  end

  def delete
     @section = Section.find(params[:id])
    
  end
  
  def destroy
     @section = Section.find(params[:id])
     flash[:notice] = "Everything Was Destroyed"
     @section.destroy
     redirect_to(sections_path)
     
  
  end 
  
  private
    def section_params
      params.require(:section).permit(:page_id, :name, :position, :visible,
              :content_type, :content)
    end 
    
end
