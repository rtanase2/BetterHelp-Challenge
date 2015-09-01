class Submission < ActiveRecord::Base
    belongs_to :survey
    serialize :results
end
