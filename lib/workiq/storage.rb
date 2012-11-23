module Workiq
  DEFAULT_EXPIRY = 60 * 30
  class Storage
    class << self
      def store_field(jid, field)
        Sidekiq.redis do |conn|
          result = conn.multi do
            conn.hmset jid, *(field.to_a.flatten)
            conn.expire jid, Workiq::DEFAULT_EXPIRY
            conn.publish "#{jid}-field-update", jid
          end
          result[0]
        end
      end

      def read_field(jid, field)
        Sidekiq.redis do |conn|
          conn.hmget(jid, field)[0]
        end
      end
    end
  end
end
