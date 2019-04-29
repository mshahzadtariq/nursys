module Nursys
  class ManageNurseList

    class << self

      def request nurse
        Nursys::Api.call(:manage_nurse_list, to_xml(nurse))
      end

      protected

      def to_xml nurse
        builder = Nokogiri::XML::Builder.new do |xml|
          xml.send('s:Envelope', 'xmlns:s': 'http://schemas.xmlsoap.org/soap/envelope/') do
            xml.send('s:Body') do
              xml.ManageNurseListRequest(xmlns: 'http://com.nursys.services.ServiceModel/2012/eNotifyService') do
                xml.Credentials('xmlns:a': 'http://com.nursys.services.ServiceModel/2012/Credentials', 'xmlns:i': 'http://www.w3.org/2001/XMLSchema-instance') do
                  xml.send('a:Username', Nursys.configuration.user_name)
                  xml.send('a:Password', Nursys.configuration.password)
                end
                xml.Nurses('xmlns:a': 'http://com.nursys.services.ServiceModel/2012/eNotify', 'xmlns:i': 'http://www.w3.org/2001/XMLSchema-instance') do

                    xml.send('a:Nurse') do
                      nurse.each do |k, v|
                        xml.send("a:#{k}", v.to_s)
                      end
                    end

                end
                xml.TransactionID nurse['RecordID']
              end
            end
          end
        end

        builder.to_xml
      end

    end

  end
end