require 'time'

class AppointmentsController < ApplicationController

  def create
    @doctor_schedule = DoctorSchedule.find_by_id(params[:id_doctor_schedule])

    @start_at = seconds_since_midnight(Time.parse(params[:start_at]).strftime("%H : %M"))
    @doctor_schedule_start = seconds_since_midnight(@doctor_schedule.start_at.strftime("%H : %M"))

    @count = Appointment.where(id_doctor_schedule: params[:id_doctor_schedule] , created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count

    if (@doctor_schedule_start - @start_at + (30 * 60) > 0 && @count < 10 && !@already_appointment)
      @already_appointment = Appointment.where(id_doctor_schedule: params[:id_doctor_schedule], id_user: @current_user.id , created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).first
      if (@already_appointment.nil?)
        @appointment = Appointment.create(id_doctor_schedule: params[:id_doctor_schedule],
                                          id_user: @current_user.id,
                                          start_at: params[:start_at],
                                          end_at: params[:end_at])

        return_success(@appointment)
      else
        return_failed('Anda sudah terdaftar silahkan menunggu giliran anda')
      end
    else
      return_failed('Waktu Booking Telah Habis')
    end
  end

  def seconds_since_midnight(time)
    Time.parse(time).hour * 3600 + Time.parse(time).min * 60 + Time.parse(time).sec
  end

end
