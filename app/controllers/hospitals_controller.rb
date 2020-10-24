class HospitalsController < ApplicationController
  skip_before_action :authenticate_request

  def index
    @hospital = Hospital.all
    return_success(JSON.parse(HospitalSerializer.new(@hospital).to_serialize_json))
  end
end
