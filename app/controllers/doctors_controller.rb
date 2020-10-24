class DoctorsController < ApplicationController
  skip_before_action :authenticate_request

  def index
    @doctor = Doctor.all
    return_success(JSON.parse(DoctorSerializer.new(@doctor).to_serialize_json))
  end

  def schedule
    @doctor = DoctorSchedule.all
    return_success(JSON.parse(DoctorScheduleSerializer.new(@doctor).to_serialize_json))
  end
end
