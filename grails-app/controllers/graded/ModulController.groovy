package graded

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

class ModulController {

    ModulService modulService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(Role.USER)
    def index() {

        // Alle Module laden und sortieren nach Semester (desc)
        List<Modul> module = modulService.list().sort { a, b ->
            int res = b.semester.jahr <=> a.semester.jahr
            return res ?: b.semester.semesterTyp <=> a.semester.semesterTyp
        }

        // Das Modul filtern welches die meisten Noten hat (wird für die Darstellung der Spalten benötigt)
        Modul modulMitMeistenNoten = module.max { m -> m.getNoten() != null ? m.getNoten().size() : 0 }

        // Zählen der Noten
        int hoechsteAnzahlNoten = modulMitMeistenNoten != null && modulMitMeistenNoten.getNoten() != null ? modulMitMeistenNoten.getNoten().size() : 0

        render view: 'index', model: [module: module, hoechsteAnzahlNoten: hoechsteAnzahlNoten]
    }

    @Secured(Role.USER)
    def create() {
        respond new Modul(params)
    }

    @Secured(Role.USER)
    def save(Modul modul) {
        if (modul == null) return // TODO throw Error

        try {
            for (int i = 0; i < modul.anzahlNoten; i++) {
                modul.addToNoten(Note.create())
            }
            modulService.save(modul)
        } catch (ValidationException e) {
            respond modul.errors, view: 'create'
            return
        }

        redirect(view: 'index')
    }

    @Secured(Role.USER)
    def edit(Long id) {
        render view: 'edit', model: [modul: modulService.get(id)]
    }

    @Secured(Role.USER)
    def update(Modul modul) {
        if (modul == null) return // TODO throw Error

        modulService.save(modul)

        redirect(view: 'index')
    }

}
