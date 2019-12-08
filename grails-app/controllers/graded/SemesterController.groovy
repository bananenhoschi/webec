package graded

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

@Secured([Role.STUDENT, Role.ADMIN])
class SemesterController {

    SemesterService semesterService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(){
        render view: 'index', model: [semesters: semesterService.list(params)]
    }

    def edit(Long id) {
        render view: 'edit', model: [semester: semesterService.get(id)]
    }

    def create() {
        respond new Semester(params)
    }

    def save(Semester semester) {
        if (semester == null) return // TODO throw Error

        try {
          
            semesterService.save(semester)
        } catch (ValidationException e) {
            respond semester.errors, view: 'create'
            return
        }

        redirect(view: 'index')
    }

    def update(Semester semester) {
        if (semester == null) return // TODO throw Error

        semesterService.save(semester)

        redirect(view: 'index')
    }
    def delete(Long id){
        semesterService.delete(id: id)
        redirect(view: 'index')

    }

}
