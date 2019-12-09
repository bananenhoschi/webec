package graded


class BootStrap {

    SecurityService securityService
    SemesterService semesterService

    def init = { servletContext ->
        Role adminRole = new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
        Role studentRole = new Role(authority: 'ROLE_STUDENT').save(failOnError: true)
        Role guestRole = new Role(authority: 'ROLE_GUEST').save(failOnError: true)

        User user = new User(username: 'user', password: 'user').save(failOnError: true)
        User admin = new User(username: 'admin', password: 'admin').save(failOnError: true)
        User guest = new User(username: 'guest', password: 'guest').save(failOnError: true)

        securityService.create(user, studentRole)
        securityService.create(admin, adminRole)
        securityService.create(guest, guestRole)

        // ----------------------

        Semester vor = new Semester(semesterTyp: SemesterTyp.VOR, jahr: 99).save(failOnError: true)
        Semester hs16 = new Semester(semesterTyp: SemesterTyp.HS, jahr: 16).save(failOnError: true)
        Semester fs16 = new Semester(semesterTyp: SemesterTyp.FS, jahr: 16).save(failOnError: true)
        Semester fs17 = new Semester(semesterTyp: SemesterTyp.FS, jahr: 17).save(failOnError: true)
        Semester hs17 = new Semester(semesterTyp: SemesterTyp.HS, jahr: 17).save(failOnError: true)
        Semester fs18 = new Semester(semesterTyp: SemesterTyp.FS, jahr: 18).save(failOnError: true)
        Semester hs18 = new Semester(semesterTyp: SemesterTyp.HS, jahr: 18).save(failOnError: true)
        Semester fs19 = new Semester(semesterTyp: SemesterTyp.FS, jahr: 19).save(failOnError: true)
        Semester hs19 = new Semester(semesterTyp: SemesterTyp.HS, jahr: 19).save(failOnError: true)
        Semester fs20 = new Semester(semesterTyp: SemesterTyp.FS, jahr: 20).save(failOnError: true)

    }
}