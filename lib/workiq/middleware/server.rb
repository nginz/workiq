module Workiq
  module Middleware
    class Server
      def call(worker, msg, queue)
        jid = msg['jid']
        Workiq::Storage.store_field jid, 'status' => 'working'
        yield
        Workiq::Storage.store_field jid, 'status' => 'complete'
      rescue
        Workiq::Storage.store_field jid, 'status' => 'failed'
        raise
      end
    end
  end
end