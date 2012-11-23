module Workiq
  module Middleware
    class Client
      def call(worker_class, msg, queue)
        jid = msg['jid']
        Workiq::Storage.store_field(jid, :status => :queued)
        yield
      end
    end
  end
end