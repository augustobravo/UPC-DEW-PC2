class Tweet < ActiveRecord::Base
  attr_accessible :message, :url, :user

  Twitter.configure do |config|
    config.consumer_key = 'h18mqPUlfvgJe59qXu4Mw'
    config.consumer_secret = 'KbSdDaarKmPMROPdVBWHVrCfPoPUWYUBP6uwpLmZE'
    config.oauth_token = '71257300-8UtI4QdrmYCsI6CyfLLkXwz3VymemE4SU8g91tjOD'
    config.oauth_token_secret = 'BqGdU4aVyPwS8ajvL6DyagqegxzuBmdxztXYS9YxqE'
  end
  def read_message
    return "no hay user" if self.user.blank?
    Twitter.user_timeline(self.user).first.text
  end

  def update_status
  	return "no hay status" if self.message.blank?
  	Twitter.update(self.message)
  end
end
