package graded

import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.NOT_FOUND

class ModulController {

    ModulService modulService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        List<Modul> module = modulService.list()
        int maxEns = module.max { m -> m.getEns().size() }.ens.size()
        respond module, model: [semesterCount: modulService.count(), maxENs: maxEns]
    }

    def show(Long id) {
        respond modulService.get(id)
    }

    def create() {
        respond new Modul(params)
    }

    def save(Modul modul) {
        if (modul == null) {
            return
        }

        try {
            if(modul.ens == null){
                modul.setEns(new HashSet<Note>())
            }
            modulService.save(modul)
        } catch (ValidationException e) {
            respond modul.errors, view: 'create'
            return
        }

        redirect(view: 'index')
    }

    def edit(Long id) {
        respond modulService.get(id)
    }

    def update(Modul modul) {
        if (modul == null) {
            return
        }

        try {
            modulService.save(modul)
        } catch (ValidationException e) {
            respond modul.errors, view: 'edit'
            return
        }

        redirect(action: "index")
    }

}
