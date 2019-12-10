package graded

import grails.gorm.transactions.Rollback
import grails.testing.mixin.integration.Integration
import org.hibernate.SessionFactory
import spock.lang.Specification

@Integration
@Rollback
class ModulServiceSpec extends Specification {

    SemesterService semesterService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Semester(...).save(flush: true, failOnError: true)
        //new Semester(...).save(flush: true, failOnError: true)
        //Semester semester = new Semester(...).save(flush: true, failOnError: true)
        //new Semester(...).save(flush: true, failOnError: true)
        //new Semester(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //semester.id
    }

    void "test get"() {
        setupData()

        expect:
        semesterService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Semester> semesterList = semesterService.list(max: 2, offset: 2)

        then:
        semesterList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        semesterService.count() == 5
    }

    void "test delete"() {
        Long semesterId = setupData()

        expect:
        semesterService.count() == 5

        when:
        semesterService.delete(semesterId)
        sessionFactory.currentSession.flush()

        then:
        semesterService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Semester semester = new Semester()
        semesterService.save(semester)

        then:
        semester.id != null
    }
}
