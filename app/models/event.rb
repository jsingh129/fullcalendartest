class Event < ActiveRecord::Base
    scope :between, lambda {|start_time,end_time|
        {:conditions => ["? < start_time < ?", Event.format_date(start_time), Event.format_date(end_time)]}
    }
    
    # json override
    def as_json(options = {})
        {
            :id => self.id,
            :title => self.title,
            :description => self.description || "",
            :start => start_time.rfc822,
            :end => end_time.rfc822,
            :url => Rails.application.routes.url_helpers.event_path(id),
        }
    end
    
    def self.format_date(date_time)
        Time.at(date_time.to_i).to_formatted_s(:db)
    end
end

