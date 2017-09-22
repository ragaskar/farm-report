class FarmReport
  class Candidate
    def initialize(attrs = {})
      @id = attrs.fetch(:id)
    end

    attr_reader :id

    def ==(other)
      other.is_a?(FarmReport::Candidate) && @id == other.id
    end

    def as_json(opts ={})
      {
        id: @id
      }
    end
  end
end


