package graded

import groovy.transform.CompileStatic

@CompileStatic
class BootStrap {

    ModulService modulService
    SemesterService semesterService

    def init = { servletContext ->

        Semester hs19 = semesterService.save(SemesterTyp.HS, 19)

        Modul algd1 = Modul.create()
        algd1.setModulKuerzel('algd1')
        algd1.setCredits(3)
        algd1.setSemester(hs19)

        Note n1 = Note.create()
        n1.setNote((double) 5.0)
        n1.setGewichtung((double) 1.0)

        Note msp = Note.create()
        msp.setNote((double) 4.0)
        msp.setGewichtung((double) 1.0)

        Set<Note> ens = new HashSet<>()
        ens.add(n1);
        Modul.saveAll(ens)
        algd1.setEns(ens)
        algd1.setMsp(msp)
        modulService.save(algd1)

    }

    def destroy = {
    }
}
