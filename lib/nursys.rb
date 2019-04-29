require 'savon'
require 'nokogiri'
require 'nursys/extensions/string'
require 'nursys/configuration'
require 'nursys/api'
require 'nursys/nurse'
require 'nursys/license'
require 'nursys/manage_nurse_list'
require 'nursys/submit_nurse_lookup'
require 'nursys/retrieve_nurse_lookup'
require 'nursys/notification'

module Nursys

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

end
