package graded

class ModulController {

    ModulService modulService

    def index() {
        respond modulService.list()
    }
}
