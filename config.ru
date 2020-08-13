require './config/environment'
require 'date'


use Rack::MethodOverride
run ApplicationController
use PurchasesController
use BudgetsController
use UsersController
use SessionsController
