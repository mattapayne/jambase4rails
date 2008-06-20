require 'jam_base4_rails'
JamBase4Rails::HttpGateway.logger = RAILS_DEFAULT_LOGGER
ActionView::Base.send(:include, JamBase4Rails::ViewHelper)
