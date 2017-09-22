require 'spec_helper'
require 'farm-report/repos/candidate_repo'

describe FarmReport::Repos::CandidateRepo do
  it "should return candidates by location" do
    client = double
    mother = ObjectMother.new
    candidate_1 = mother.candidate
    job_id = "some-job-id"
    allow(client).to receive(:get_all).with('/v1/candidates',{job_id:'some-job-id'}).and_return([candidate_1.as_json])
    repo = FarmReport::Repos::CandidateRepo.new(client)
    candidates = repo.candidates(job_id: job_id)
    expect(candidates).to eq([candidate_1])
  end
end
