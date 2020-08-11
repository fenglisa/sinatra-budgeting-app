require './config/environment'


use Rack::MethodOverride
run ApplicationController
use PurchasesController
use BudgetsController
use UsersController
use SessionsController
