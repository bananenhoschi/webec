package graded

import grails.testing.web.controllers.ControllerUnitTest
import grails.validation.ValidationException
import spock.lang.Specification

class ModulControllerSpec extends Specification implements ControllerUnitTest<ModulController> {

    void "Test the index action returns the correct model"() {
        given:
        controller.modulService =  Stub(ModulService) {
            list(_) >> []
        }

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.module
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.modul != null
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
        controller.modulService = Mock(ModulService) {
            1 * save(_ as Modul)
        }

        when: "The save action is executed with a valid instance"
        response.reset()
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        def modul = new Modul(params)
        modul.id = 1

        controller.save(modul)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/modul/index'
    }

    void "Test the save action with an invalid instance"() {
        given:
        controller.modulService = Mock(ModulService) {
            1 * save(_ as Modul) >> { Modul modul ->
                throw new ValidationException("Invalid instance", modul.errors)
            }
        }

        when: "The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        def modul = new Modul()
        controller.save(modul)

        then: "The create view is rendered again with the correct model"
        model.modul != null
        view == 'create'
    }

    void "Test the edit action with a null id"() {
        given:
        controller.modulService = Mock(ModulService) {
            0 * get(null) >> null
        }

        when: "The show action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404
    }

    void "Test the edit action with a valid id"() {
        given:
        controller.modulService = Mock(ModulService) {
            1 * get(2) >> new Modul()
        }

        when: "A domain instance is passed to the show action"
        controller.edit(2)

        then: "A model is populated containing the domain instance"
        model.modul instanceof Modul
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
        controller.modulService = Mock(ModulService) {
            1 * save(_ as Modul)
        }

        when: "The save action is executed with a valid instance"
        response.reset()
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        def modul = new Modul(params)
        modul.id = 1

        controller.update(modul)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/modul/index'
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
        controller.modulService = Mock(ModulService) {
            get(_) >> new Modul(id: 2, kuerzel: 'webec')
            1 * delete(_)
        }

        when: "The domain instance is passed to the delete action"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        request.addParameter('id', '2')
        controller.delete()

        then: "The user is redirected to index"
        response.redirectedUrl == '/modul/index'
    }
}
