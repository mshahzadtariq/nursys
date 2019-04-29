module Nursys
  class Notification




    class << self

      def where start_date=Date.todat-1.month, end_date=Date.today, transaction_id
        #
        #
        #
        Nursys::Api.call(:notification_lookup, xml_markup(start_date, end_date, transaction_id))
      end

      protected

      def xml_markup start_date, end_date, transaction_id
        builder = Nokogiri::XML::Builder.new do |xml|
          xml.send('s:Envelope', 'xmlns:s': 'http://schemas.xmlsoap.org/soap/envelope/') do
            xml.send('s:Body') do
              xml.NotificationLookupRequest(xmlns: 'http://com.nursys.services.ServiceModel/2012/eNotifyService') do
                xml.Credentials('xmlns:a': 'http://com.nursys.services.ServiceModel/2012/Credentials', 'xmlns:i': 'http://www.w3.org/2001/XMLSchema-instance') do
                  xml.send('a:Username', Nursys.configuration.user_name)
                  xml.send('a:Password', Nursys.configuration.password)
                end
                xml.EndDate end_date
                xml.StartDate start_date
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