module Workiq
  module Middleware
    class Server
      def call(worker, msg, queue)
        jid = msg['jid']
        if msg[:status]
          Workiq::Storage.store_field jid, 'status' => 'working'
          yield
          Workiq::Storage.store_field jid, 'status' => 'complete'
        else
          yield
        end
      rescue
        if msg[:status]
          Workiq::Storage.store_field jid, 'status' => 'failed'
        end
        raise
      end
    end
  end
end