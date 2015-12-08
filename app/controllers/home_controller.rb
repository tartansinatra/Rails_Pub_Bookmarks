class HomeController <ApplicationController

  def welcome
    render 'new'
  end

  def show
    begin
    @bookmarks = Bookmark.find(params[:id]) 
    rescue
    @error = "Sorry, none available."
    end
  end

  def create
    @bookmark = Bookmark.create(persist_bookmark(params))
    redirect_to @bookmark
  end

  private 

  def persist_bookmark(params)
    params.require(:bookmark).permit(:id, :name, :url, :genre, :imageurl)
  end

  def search
  end

  def name
    @bookmark = Bookmark.find(params[:name])
  end

end