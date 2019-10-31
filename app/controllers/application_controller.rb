class ApplicationController < ActionController::Base
  include UserHelper # pour éviter de le rappeler dans tous les autres controllers

end
