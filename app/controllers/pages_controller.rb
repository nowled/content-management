class PagesController < ApplicationController
  def index
    
    @pages = Page.sorted
  end

  def show
    
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "This Page Has Been Successfully Updated"
      redirect_to(pages_path)
    else
      render('new')
    end 
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    
    @page = Page.find(params[:id])
    flash[:notice] = "Your Shit was updated Succesfully"
    if @page.update_attributes(page_params)
      redirect_to(page_path(@page))
    else
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
