package graded

import groovy.transform.CompileStatic

@CompileStatic
class BootStrap {

    ModulService modulService


    def init = { servletContext ->

        Semester hs19 = Semester.create()
        hs19.setSemesterTyp(SemesterTyp.HS)
        hs19.setJahr(19)
        hs19.save()

        Semester hs16 = Semester.create()
        hs16.setSemesterTyp(SemesterTyp.HS)
        hs16.setJahr(16)
        hs16.save()

        Modul algd1 = Modul.create()
        algd1.setKuerzel('algd1')
        algd1.setBezeichnung('Algorithmen und Datenstrukturen 1')
        algd1.setCredits(3)
        algd1.setSemester(hs19)
        algd1.save()

        Modul webpr = Modul.create()
        webpr.setKuerzel('webpr')
        webpr.setBezeichnung('Web Programming')
        webpr.setCredits(3)
        webpr.setSemester(hs19)
        webpr.setHasMsp(false)
        webpr.addToNoten(Note.create())
        webpr.save()

        Modul webfr = Modul.create()
        webfr.setKuerzel('webfr')
        webfr.setBezeichnung('Web Frameworks')
        webfr.setCredits(3)
        webfr.setSemester(hs19)
        webfr.setNoten(Set.of())
        webfr.save()

        Modul agrh = Modul.create()
        agrh.setKuerzel('agrh')
        agrh.setBezeichnung('Argumentation und Rethorik')
        agrh.setCredits(2)
        agrh.setHasTestat(true)
        agrh.setSemester(hs19)
        agrh.save()


    }

    def destroy = {
    }
}
