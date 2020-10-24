class DoctorScheduleSerializer < ActiveModel::Serializer
  def initialize(doctor_object)
    @doctor = doctor_object
  end

  def to_serialize_json
    @doctor.to_json(:include =>
                        {
                            :doctor_hospital => {:include =>
                                                     {
                                                         :doctor => {:except => [:created_at, :updated_at]},
                                                         :hospital => {:except => [:created_at, :updated_at]}
                                                     },
                                                 :except => [:created_at, :updated_at]},
                            :appointment => {:except => [:created_at, :updated_at]},
                        },
                    :except => [:created_at, :updated_at])
  end
end
