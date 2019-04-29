module Nursys
  class Api

    API_END_POINT = "https://services.nursys.com/eNotifyService.svc?wsdl=wsdl0"

    class << self

      def call method, xml
        response = self.client.call(method, xml: xml)
        response.body
      end

      def client
        ::Savon.client(
            wsdl: 'https://services.nursys.com/eNotifyService.svc?wsdl=wsdl0',
            endpoint: 'https://services.nursys.com/ENotifyService.svc',
            log_level: :debug,
            log: true,
            pretty_print_xml: true
        )
      end
    end

  end
end