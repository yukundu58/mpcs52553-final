class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
  end

  def edit
    if !(session["user_id"].blank?) and (User.find_by(id: session["user_id"]).is_admin == true)
      render "edit"
    else
      redirect_to "/"
    end
  end

  def update
    library = Library.find_by(id: params["id"])
    library.name = params["name"]
    library.address = params["address"]
    library.photo_url = params["photo_url"]
    library.description = params["description"]
    library.room_number = params["room_number"]
    library.save
    redirect_to "/"
  end

  def destroy
    if !(session["user_id"].blank?) and (User.find_by(id: session["user_id"]).is_admin == true)
      library = Library.find_by(id: params["id"])
      library.delete
    end
    redirect_to "/"
  end

  def create
    Library.create :name => params["name"],
                 :address => params["address"],
                 :photo_url => params["photo_url"],
                 :description => params["description"],
                 :room_number => params["room_number"]
    redirect_to "/"
  end

end
