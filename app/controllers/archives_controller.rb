class ArchivesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @archive = Archive.new(archive_params)
      
    if @archive.save
      # @items_import = ItemsImport.new(params[:items_import])
      @items_import = ItemsImport.new(import_params)
      if @items_import.save
        redirect_to items_path, notice: "The document #{@archive.name} has been uploaded."
      else
        redirect_to items_path, notice: "The document #{@archive.name} could not been parsed"
      end
    else
      redirect_to items_path, notice: "The document #{@archive.name} could not been uploaded"
    end
  end

  def destroy
  end

  private

  def archive_params
    params.require(:archive).permit(:attachment)
  end

  def import_params
    params.require(:archive).permit(:attachment)
  end
end
