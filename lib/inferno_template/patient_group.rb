module InfernoTemplate
  class PatientGroup < Inferno::TestGroup
    title 'Patient Read Test'
    description 'Verify that the server supports FHIR Patient read'
    id :patient_group

    test do
      id :patient_read
      makes_request :fhir_patient # Named requests can be used by other tests​

      title 'Read Patient'
      description 'Read Patient with id 85'

      run do
        # FHIR requests will automatically use the client declared above
        fhir_read('Patient', '85', name: :fhir_patient)
    
        assert_response_status(200)
        assert_resource_type('Patient')
      end
    end

    test do
      title 'Validate Patient Resource'
      description 'Validate Patient Resource against US Core Patient Profile'
      # This test will use the response from the :fhir_patient request in the previous test
      uses_request :fhir_patient
      
      run do
        assert_valid_resource(profile_url: 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient')
      end
    end
  end
end
