package graded

import grails.gorm.transactions.Rollback
import grails.testing.mixin.integration.Integration
import grails.testing.web.controllers.ControllerUnitTest
import grails.validation.ValidationException
import spock.lang.Specification

@Integration
@Rollback
class SemesterControllerSpec extends Specification implements ControllerUnitTest<SemesterController> {

    void "Test the index action returns the correct model"() {
        given:
        controller.semesterService = Mock(SemesterService) {
            1 * list(_) >> []
        }

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.semesters
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.semester != null
    }

    void "Test the save action with a null instance"() {
        when: "Save is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        controller.save(null)

        then: "A 404 error is returned"
        response.status == 404
    }

    void "Test the save action correctly persists"() {
        given:
        controller.semesterService = Mock(SemesterService) {
            1 * save(_ as Semester)
        }

        when: "The save action is executed with a valid instance"
        response.reset()
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        def semester = new Semester(params)
        semester.id = 1

        controller.save(semester)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/semester/index'
    }

    void "Test the save action with an invalid instance"() {
        given:
        controller.semesterService = Mock(SemesterService) {
            1 * save(_ as Semester) >> { Semester semester ->
                throw new ValidationException("Invalid instance", semester.errors)
            }
        }

        when: "The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        def semester = new Semester()
        controller.save(semester)

        then: "The create view is rendered again with the correct model"
        model.semester != null
        view == 'create'
    }

    void "Test the edit action with a null id"() {
        given:
        controller.semesterService = Mock(SemesterService) {
            0 * get(null) >> null
        }

        when: "The show action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404
    }

    void "Test the edit action with a valid id"() {
        given:
        controller.semesterService = Mock(SemesterService) {
            1 * get(2) >> new Semester()
        }

        when: "A domain instance is passed to the show action"
        controller.edit(2)

        then: "A model is populated containing the domain instance"
        model.semester instanceof Semester
    }


    void "Test the update action with a null instance"() {
        when: "Save is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        controller.update(null)

        then: "A 404 error is returned"
        response.status == 404
    }

    void "Test the update action correctly persists"() {
        given:
        controller.semesterService = Mock(SemesterService) {
            1 * save(_ as Semester)
        }

        when: "The save action is executed with a valid instance"
        response.reset()
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        def semester = new Semester(params)
        semester.id = 1

        controller.update(semester)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/semester/index'
    }


    void "Test the delete action with a null instance"() {
        when: "The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete()

        then: "A 404 is returned"
        response.status == 404
    }

    void "Test the delete action with an instance"() {
        given:
        controller.semesterService = Mock(SemesterService) {
            get(_) >> new Semester(id: 2, kuerzel: 'webec')
            1 * delete(_)
        }

        when: "The domain instance is passed to the delete action"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        request.addParameter('id', '2')
        controller.delete()

        then: "The user is redirected to index"
        response.redirectedUrl == '/semester/index'
    }
}






