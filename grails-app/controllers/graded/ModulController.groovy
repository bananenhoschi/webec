package graded

class ModulController {

    ModulService modulService

    def module() {
        List<Modul> module = modulService.list()
        int maxEns = module.max {m -> m.getEns().size()}.ens.size()

        render view: 'module', model: [module: modulService.list(), maxENs: maxEns]
    }
}
