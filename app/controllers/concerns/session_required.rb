# frozen_string_literal: true

module SessionRequired
  extend ActiveSupport::Concern

  included do
    include AbstractController::Callbacks::ClassMethods

    protect_from_forgery prepend: true
    before_action :authenticate_user!
  end
end