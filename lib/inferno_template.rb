require_relative 'inferno_template/patient_group'

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

    # Tests and TestGroups can be written in separate files and then included
    # using their id
    group from: :patient_group
  end
end
