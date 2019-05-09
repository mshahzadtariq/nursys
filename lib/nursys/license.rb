module Nursys
  class License

    ATTRIBUTES = [
        :license_number,
        :jurisdiction,
        :license_type,
        :record_ID
    ]

    attr_accessor(*ATTRIBUTES)

    def initialize attributes={}
      attributes.each { |k, v| self.send("#{k}=", v) }
    end

    def save
      response = Nursys::SubmitNurseLookup.request(self.to_hash)
      response[:submit_nurse_lookup_response][:transaction][:transaction_success_flag] ? response[:submit_nurse_lookup_response][:transaction][:transaction_id] : response[:submit_nurse_lookup_response][:transaction][:transaction_success_flag]
    end

    def to_hash
      hash = Hash.new
      ATTRIBUTES.each do |attr|
        hash[attr.to_s.keyify] = self.send(attr)
      end
      hash
    end

    class << self
      def find transaction_id
        response = Nursys::RetrieveNurseLookup.request(transaction_id)
        response[:nurse_lookup_response][:nurse_license_responses][:nurse_license_response][:success_flag] ?
            response[:nurse_lookup_response][:nurse_license_responses][:nurse_license_response][:nurse_licenses][:nurse_license] :
            response[:nurse_lookup_response][:nurse_license_responses][:nurse_license_response][:success_flag]
      end
    end

  end
end