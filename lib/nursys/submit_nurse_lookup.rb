module Nursys
  class SubmitNurseLookup

    class << self

      def request license
        Nursys::Api.call(:submit_nurse_lookup, to_xml(license))
      end

      protected

      def to_xml license
        builder = Nokogiri::XML::Builder.new do |xml|
          xml.send('s:Envelope', 'xmlns:s': 'http://schemas.xmlsoap.org/soap/envelope/') do
            xml.send('s:Body') do
              xml.NurseLookupRequest(xmlns: 'http://com.nursys.services.ServiceModel/2012/eNotifyService') do
                xml.Credentials('xmlns:a': 'http://com.nursys.services.ServiceModel/2012/Credentials', 'xmlns:i': 'http://www.w3.org/2001/XMLSchema-instance') do
                  xml.send('a:Username', Nursys.configuration.user_name)
                  xml.send('a:Password', Nursys.configuration.password)
                end
                xml.LicenseRequests('xmlns:a': 'http://com.nursys.services.ServiceModel/2012/eNotify', 'xmlns:i': 'http://www.w3.org/2001/XMLSchema-instance') do

                  xml.send('a:LicenseRequest') do
                    license.each do |k, v|
                      xml.send("a:#{k}", v.to_s)
                    end
                  end

                end
                # xml.TransactionID nurse['RecordID']
              end
            end
          end
        end

        builder.to_xml
      end

    end

  end
end