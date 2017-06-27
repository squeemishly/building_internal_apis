class ApplicationController < ActionController::API
end


#This is one of the things that is different when you run:
# rails new project_name --api to create a new project instead of rails new project_name
# If you are in a project that needs an API and HTML, you have the following options:

# Rails 5+
# class ApiBaseController < ActionController::API
# end
#
# Rails < 4
# class ApiBaseController < ActionController::Base
#   protect_from_forgery :null_session
# end
#
# class Api::V1::ItemsController < ApiBaseController
# end
