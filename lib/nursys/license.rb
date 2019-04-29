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
      Nursys::SubmitNurseLookup.request(self.to_hash)
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
        Nursys::RetrieveNurseLookup.request(transaction_id)
      end
    end

  end
end