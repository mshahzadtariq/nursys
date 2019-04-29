module Nursys
  class RetrieveNurseLookup

    class << self

      def request transaction_id
        Nursys::Api.call(:retrieve_nurse_lookup, to_xml(transaction_id))
      end

      protected

      def to_xml transaction_id
        builder = Nokogiri::XML::Builder.new do |xml|
          xml.send('s:Envelope', 'xmlns:s': 'http://schemas.xmlsoap.org/soap/envelope/') do
            xml.send('s:Body') do
              xml.RetrieveNurseLookupRequest(xmlns: 'http://com.nursys.services.ServiceModel/2012/eNotifyService') do
                xml.Credentials('xmlns:a': 'http://com.nursys.services.ServiceModel/2012/Credentials', 'xmlns:i': 'http://www.w3.org/2001/XMLSchema-instance') do
                  xml.send('a:Username', Nursys.configuration.user_name)
                  xml.send('a:Password', Nursys.configuration.password)
                end
                xml.TransactionID transaction_id
              end
            end
          end
        end

        builder.to_xml
      end

    end

  end
end