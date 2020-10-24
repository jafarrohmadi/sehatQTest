class DoctorSerializer < ActiveModel::Serializer
  def initialize(doctor_object)
    @doctor = doctor_object
  end

  def to_serialize_json
    @doctor.to_json(:include =>
                        {:hospitals => {:except => [:created_at, :updated_at]}, :doctor_schedule => {:except => [:created_at, :updated_at]}},
                    :except => [:created_at, :updated_at])

  end
end
