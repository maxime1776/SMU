class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def pdf
    client = HelloSign::Client.new :api_key => ENV['HELLOSIGN_API_KEY']
    raise
    #client.get_embedded_sign_url :signature_id => '50e3542f738adfa7ddd4cbd4c00d2a8ab6e4194b'
  end
end

#client.get_embedded_sign_url :signature_id => '8263291edf80fd3ad6c2fa91d645251d49b543a7'
