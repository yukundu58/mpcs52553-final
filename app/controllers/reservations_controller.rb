class ReservationsController < ApplicationController

  def index
    if session["user_id"].blank?
      redirect_to "/login"
      return
    else
      @user = User.find_by(id: session["user_id"])
      @reservations = User.find_by(username: @user.username).reservations.where(canceled: false).order('date desc, start_time desc')
    end
  end

  def create
    if session["user_id"].blank?
      redirect_to "/login"
      return
    else

      # make sure the date of reservation is later than today
      if params["date"] <= Date.today.to_s
        flash[:danger] = "You can only make reservation which later than today!"
        redirect_to "/libraries/#{params["library_id"]}"
        return
      end

      # make sure the end time is later than start time
      time1 = params["start_time"].split(':')[0].to_i
      time2 = params["end_time"].split(':')[0].to_i
      if time1 >= time2
        flash[:danger] = "Reservation's end time should be later than start time!"
        redirect_to "/libraries/#{params["library_id"]}"
        return
      end

      # make sure there is enough space left
      conflict_reservations = Reservation.where(canceled: false).where(date: params["date"]).where(library_id: params["library_id"])
      left_rooms = Library.find_by(id: params["library_id"]).room_number
      conflict_reservations.each do |r|
          t1 = r.start_time.to_i
          t2 = r.end_time.to_i
          if !(t1 >= time2 || t2 <= time1)
            if r.user_id == session["user_id"]
              flash[:danger] = "It's duplicate reservation, try another time block!"
              redirect_to "/libraries/#{params["library_id"]}"
              return
            end
            left_rooms -= 1
          end
      end

      if left_rooms <= 0
        flash[:danger] = "There is no more available room for this time range!"
        redirect_to "/librarys/#{params["library_id"]}"
        return
      else
        reservation = Reservation.new
        reservation.user_id = session["user_id"]
        reservation.library_id = params["library_id"]
        reservation.date = params["date"]
        reservation.start_time = params["start_time"]
        reservation.end_time = params["end_time"]
        reservation.save
        redirect_to "/reservations"
        return
      end

    end
  end

    def destroy
      reservation = Reservation.find_by(id: params['id'])
      reservation.update(canceled: true)
      redirect_to "/reservations"
    end

    def show_all
      if session["user_id"].blank?
        redirect_to "/login"
      else
        if User.find_by(id: session["user_id"]).is_admin == true
          @reservations = Reservation.all.order('library_id asc, date desc, start_time desc')
          render "show_all"
        else
          flash[:danger] = "You are not Administrator!"
          redirect_to "/"
        end
      end
    end

end
