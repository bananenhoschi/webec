package graded

class ModulController {

    ModulService modulService

    def index() {
        List<Modul> module = modulService.list()
        int maxEns = module.max {m -> m.getEns().size()}.ens.size()

        render view: 'index', model: [module: modulService.list(), maxENs: maxEns]
    }
}
