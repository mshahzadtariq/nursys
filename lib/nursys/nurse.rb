module Nursys
  class Nurse

    ATTRIBUTES = [
        :submission_action_code,
        :jurisdiction,
        :license_number,
        :license_type,
        :email,
        :cell_phone_number,
        :address1,
        :address2,
        :city,
        :state,
        :zip,
        :last_four_SSN,
        :birth_year,
        :hospital_practice_setting,
        :hospital_practice_setting_other,
        :notifications_enabled,
        :reminders_enabled,
        :location_list,
        :record_ID
    ]

    attr_accessor(*ATTRIBUTES)

    def initialize attributes={}
      attributes.each { |k, v| self.send("#{k}=", v) }
    end

    def submission_action_code
      @submission_action_code.nil? ? 'A' : @submission_action_code
    end

    def notifications_enabled
      @notifications_enabled.nil? ? '0' : @notifications_enabled
    end

    def reminders_enabled
      @reminders_enabled.nil? ? '0' : @reminders_enabled
    end

    def hospital_practice_setting
      @hospital_practice_setting.nil? ? '0' : @hospital_practice_setting
    end

    def save
      Nursys::ManageNurseList.request(self.to_hash)
    end

    def to_hash
      hash = Hash.new
      ATTRIBUTES.each do |attr|
        hash[attr.to_s.keyify] = self.send(attr) unless self.send(attr).nil?
      end
      hash
    end

  end
end