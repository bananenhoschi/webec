package graded


import grails.validation.ValidationException

class ModulController {

    ModulService modulService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {

        // Alle Module laden und sortieren nach Semester (desc)
        List<Modul> module = modulService.list().sort { a, b -> b.semester.jahr <=> a.semester.jahr }

        // Das Modul filtern welches die meisten Noten hat (wird für die Darstellung der Spalten benötigt)
        Modul modulMitMeistenNoten = module.max { m -> m.getNoten() != null ? m.getNoten().size() : 0 }

        // Zählen der Noten
        int hoechsteAnzahlNoten = modulMitMeistenNoten != null && modulMitMeistenNoten.getNoten() != null ? modulMitMeistenNoten.getNoten().size() : 0

        render view: 'index', model: [module: module, hoechsteAnzahlNoten: hoechsteAnzahlNoten]
    }


    def create() {
        respond new Modul(params)
    }

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

    def edit(Long id) {
        render view: 'edit', model: [modul: modulService.get(id)]
    }

    def update(Modul modul) {
        if (modul == null) return // TODO throw Error

        modulService.save(modul)

        redirect(view: 'index')
    }

}
