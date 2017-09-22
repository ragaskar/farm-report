require 'farm-report/candidate'

class FarmReport
  module Repos
    class CandidateRepo
      def initialize(client)
        @client = client
      end

      def candidates(opts = {})
        candidate_data = @client.get_all('/v1/candidates', opts)
        candidate_data.map { |c| FarmReport::Candidate.new(c) }
      end
    end
  end
end
