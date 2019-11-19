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

        Modul algd1x = Modul.create()
        algd1x.setModulKuerzel('algd1')
        algd1x.setModulBezeichnung('Algorithmen und Datenstrukturen 1')
        algd1x.setCredits(3)
        algd1x.setSemester(hs16)

        Note n1x = Note.create()
        n1x.setNote((double) 3.2)
        n1x.setGewichtung((double) 0.5)

        Note n2x = Note.create()
        n2x.setNote((double) 3.8)
        n2x.setGewichtung((double) 0.5)
        Note.saveAll(n1x, n2x)

        Note mspx = Note.create()
        mspx.setNote((double) 3.8)
        mspx.setGewichtung((double) 1.0)

        Set<Note> ensx = new HashSet<>()
        ensx.add(n1x)
        ensx.add(n2x)
        algd1x.setEns(ensx)
        algd1x.setMsp(mspx)
        modulService.save(algd1x)

        Modul algd1 = Modul.create()
        algd1.setModulKuerzel('algd1')
        algd1.setModulBezeichnung('Algorithmen und Datenstrukturen 1')
        algd1.setCredits(3)
        algd1.setSemester(hs19)

        Note n1 = Note.create()
        n1.setNote((double) 5.0)
        n1.setGewichtung((double) 0.5)

        Note n2 = Note.create()
        n2.setNote((double) 4.4)
        n2.setGewichtung((double) 0.5)
        Note.saveAll(n1, n2)

        Note msp = Note.create()
        msp.setNote((double) 4.0)
        msp.setGewichtung((double) 1.0)

        Set<Note> ens = new HashSet<>()
        ens.add(n1)
        ens.add(n2)
        algd1.setEns(ens)
        algd1.setMsp(msp)
        modulService.save(algd1)

        Modul webeC = Modul.create()
        webeC.setModulKuerzel('webeC')
        webeC.setModulBezeichnung('Web Engineering')
        webeC.setCredits(3)
        webeC.setSemester(hs19)

        Note n3 = Note.create()
        n3.setNote((double) 4.0)
        n3.setGewichtung((double) 1.0)
        Note.saveAll(n3)

        Set<Note> ens2 = new HashSet<>()
        ens2.add(n3)
        webeC.setEns(ens2)
        modulService.save(webeC)

        Modul webfr = Modul.create()
        webfr.setModulKuerzel('webfr')
        webfr.setModulBezeichnung('Web Frameworks')
        webfr.setCredits(3)
        webfr.setSemester(hs19)
        modulService.save(webfr)

        Modul agrh = Modul.create()
        agrh.setModulKuerzel('agrh')
        agrh.setModulBezeichnung('Argumentation und Rethorik')
        agrh.setCredits(2)
        agrh.setIsTestat(true)
        agrh.setSemester(hs19)
        modulService.save(agrh)


    }

    def destroy = {
    }
}
