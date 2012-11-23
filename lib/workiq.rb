require "workiq/version"
require "workiq/storage"
require "workiq/middleware/client"
require "workiq/middleware/server"
require "workiq/middleware/chain"

module Workiq
  def self.status(jid)
    Workiq::Storage.read_field(jid, :status).to_sym
  end
end
