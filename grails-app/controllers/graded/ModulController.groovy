package graded

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException


class ModulController {

    ModulService modulService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        List<Modul> module = modulService.list()
        int maxEns = module.max { m -> m.getNoten().size() }.getNoten().size()
        respond module, view: 'index', model: [semesterCount: modulService.count(), maxENs: maxEns]
    }

    def show(Long id) {
        respond modulService.get(id)
    }

    def create() {
        respond new Modul(params)
    }

    @Transactional
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

    @Transactional
    def update(Modul modul) {
        if (modul == null) {
            return
        }

        try {
            for (Note n : modul.noten) {
                Double note = params.getDouble("note-" + n.id)
                n.setNote(note)
                Double gewichtung = Double.valueOf(params.getDouble("gewichtung-" + n.id))
                n.setGewichtung(gewichtung)
            }
            modulService.save(modul)
        } catch (ValidationException e) {
            respond modul.errors, view: 'edit'
            return
        }

        redirect(action: "index")
    }

}
