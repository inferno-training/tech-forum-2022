module InfernoTemplate
  class Suite < Inferno::TestSuite
    id :test_suite_template
    title 'Inferno Test Suite Template'
    description 'A basic test suite template for Inferno'

    # FHIR clients are created to make requests
    fhir_client do
      url 'https://inferno.healthit.gov/reference-server/r4' # required
      bearer_token 'SAMPLE_TOKEN'                            # optional
      # headers 'X-Custom-Header': 'def'                     # optional
    end

    # Tests and TestGroups can be defined inline
    group do
      id :patient_group
      title 'Patient Read Test'
      description 'Verify that the server supports FHIR Patient read'

      test do
        id :patient_read
        title 'Read Patient '
        description 'Read Patient with id 85'

        run do
          # FHIR requests will automatically use the client declared above
          fhir_read('Patient', '85')
      
          assert_response_status(200)
          assert_resource_type(:patient)
        end
      end
    end
  end
end
