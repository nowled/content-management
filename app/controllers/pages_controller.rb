class PagesController < ApplicationController
  
          layout 'admin'
  
  def index
    
    @pages = Page.sorted
  end

  def show
    
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    @page_count = Page.count + 1
    @subjects = Subject.sorted
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "This Page Has Been Successfully Created"
      redirect_to(pages_path)
    else
      @page_count = Page.count + 1
      @subjects = Subject.sorted
      render('new')
    end 
  end

  def edit
    @page = Page.find(params[:id])
    @page_count = Page.count
    @subjects = Subject.sorted
  end

  def update
    
    @page = Page.find(params[:id])
    flash[:notice] = "Your Shit was updated Succesfully"
    if @page.update_attributes(page_params)
      redirect_to(page_path(@page))
    else
    @page_count = Page.count
    @subjects = Subject.sorted
       render('edit')
    end 
  end

  def delete
    @page = Page.find(params[:id])
    
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    
    flash[:notice] = "Everything in '#{@page.name}' in this path Was Destroyed"
    redirect_to(pages_path)
      
  end
  
  
  private
  
  def page_params
    params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible)
  end 
end
