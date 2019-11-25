package graded

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

class ModulController {

    ModulService modulService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        List<Modul> module = modulService.list(params)
        int maxEns = module.max { m -> m.getEns().size() }.ens.size()

        render view: 'index', model: [module: module, maxENs: maxEns]
    }


    def create() {
        respond new Modul(params)
    }

    def edit(Long id) {
        render view: 'edit', model: [modul: modulService.get(id)]
    }

    @Transactional
    def update(Modul modul) {
        if (modul == null) {
            notFound()
            return
        }

        try {
            modulService.save(modul)
            redirect(action: "index")
        } catch (ValidationException e) {
            respond modul.errors, view: 'edit'
            return
        }
    }

    protected void notFound() {
        render view: 'notFound'
    }
}
