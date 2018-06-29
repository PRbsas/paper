require './config/environment'

use Rack::MethodOverride
use UserController
use NotebookController
use TaskController
use NoteController
use BookmarkController
run ApplicationController
