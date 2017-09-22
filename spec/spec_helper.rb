$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'json'

require 'ffaker'
class ObjectMother
  def initialize
    @candidate_id = 0;
  end

  def candidate(attrs = {})
    @candidate_id += 1
    defaults = {
      id: @candidate_id,
      first_name: FFaker::Name.first_name,
      last_name: FFaker::Name.last_name,
      company: FFaker::Company.name,
      title: FFaker::Company.position,
      is_private: false,
      created_at: Time.now,
      last_activity: Time.now,
      photo_url: "https://some-photo-url",
      attachments: [],
      application_ids: [123],
      phone_numbers: [],
      addresses: [],
      email_addresses: [],
      website_addresses: [],
      social_media_addresses: [],
      recruiter: nil,
      coordinator: nil,
      tags: [],
      custom_fields: nil,
      keyed_custom_fields: nil
    }
    FarmReport::Candidate.new(
      defaults.merge(attrs)
    )
  end
end
