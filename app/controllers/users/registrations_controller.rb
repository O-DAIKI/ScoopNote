# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: %i[update destroy]
end
