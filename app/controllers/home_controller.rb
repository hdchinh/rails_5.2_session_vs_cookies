class HomeController < ApplicationController
  def index
  	cookies[:normal_cookie] = "Duy Chinh"
  	cookies.signed[:signed_cookie] = "Duy Chinh"
  	cookies.encrypted[:encrypted_cookie] = "Duy Chinh"
		session[:id] = 2
		session[:product_id] = 2
		# debugger 
  end

  def show
  	@normal_cookie = "normal: " + cookies[:normal_cookie]
  	@signed_cookie = "signed: " + cookies.signed[:signed_cookie] + "value: " + cookies.signed[:signed_cookie]
  	@encrypted_cookie = "encrypted: " + cookies[:encrypted_cookie] + "value: " + cookies.encrypted[:encrypted_cookie]
  	@session_id = session
  	# debugger
  end
end
