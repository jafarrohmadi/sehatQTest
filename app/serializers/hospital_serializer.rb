class HospitalSerializer < ActiveModel::Serializer
  def initialize(hospital_object)
    @hospital = hospital_object
  end

  def to_serialize_json
    @hospital.to_json(:include =>
                          {:doctors =>
                               {:include =>
                                    {:user =>
                                         {:except => [:created_at,
                                                      :updated_at,
                                                      :password_digest,
                                                      :provider_type,
                                                      :provider_id,
                                                      :role, :id]
                                         }
                                    },
                                :except => [:created_at, :updated_at]
                               }
                          },
                      :except => [:created_at, :updated_at])
  end
end
