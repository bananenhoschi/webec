package graded

import grails.gorm.transactions.Rollback
import grails.testing.mixin.integration.Integration
import org.hibernate.SessionFactory
import spock.lang.Specification

@Integration
@Rollback
class SemesterServiceSpec extends Specification {

    SemesterService semesterService
    SessionFactory sessionFactory
    Semester hs19
    Semester fs19

    private Long setupData() {
        hs19 = new Semester(semesterTyp: SemesterTyp.HS, jahr: 19).save(flush: true, failOnError: true)
        fs19 = new Semester(semesterTyp: SemesterTyp.FS, jahr: 19).save(flush: true, failOnError: true)
        assert hs19.id != null
        assert fs19.id != null
    }

    void "test get"() {
        setupData()

        expect:
        semesterService.get(hs19.id) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Semester> semesterList = semesterService.list()

        then:
        semesterList.size() == 2
        assert semesterList.get(0) == hs19
        assert semesterList.get(1) == fs19
    }

    void "test count"() {
        setupData()

        expect:
        semesterService.count() == 2
    }

    void "test delete"() {
        setupData()

        expect:
        semesterService.count() == 2

        when:
        semesterService.delete(hs19.id)
        sessionFactory.currentSession.flush()

        then:
        semesterService.count() == 1
    }

    void "test save"() {
        when:
        Semester semester = new Semester(semesterTyp: SemesterTyp.FS, jahr: 20)
        semesterService.save(semester)

        then:
        semester.id != null

    }
}
