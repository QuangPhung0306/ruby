class SessionsController < Devise::SessionsController
  layout "simple"
  before_action :set_cache_headers, only: :new
end
