package graded


import grails.validation.ValidationException

class ModulController {

    ModulService modulService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        List<Modul> module = modulService.list()
        Modul maxModul = module.max { m -> m.getNoten() != null ? m.getNoten().size() : 0 }
        int maxEns = maxModul != null && maxModul.getNoten() != null ? maxModul.getNoten().size() : 0
        respond module, view: 'index', model: [semesterCount: modulService.count(), maxENs: maxEns]
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
            int anzahlNoten = params.anzahlNoten == "" ? 0 : Integer.valueOf(params.anzahlNoten)
            for (int i = 0; i < anzahlNoten; i++) {
                modul.addToNoten(Note.create())
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

        modulService.save(modul)

        redirect(view: 'index')
    }

}
