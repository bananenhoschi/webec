package graded

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import org.springframework.http.HttpStatus

@Secured([Role.STUDENT, Role.ADMIN])
class SemesterController {

    SemesterService semesterService

    static allowedMethods = [save: "POST", update: "PUT"]

    def index() {
        render view: 'index', model: [semesters: semesterService.list(params)]
    }

    def edit(Long id) {
        if (id == null) {
            render status: HttpStatus.NOT_FOUND
            return
        }
        render view: 'edit', model: [semester: semesterService.get(id)]
    }

    def create() {
        respond new Semester(params)
    }

    def save(Semester semester) {
        if (semester == null) {
            render status: HttpStatus.NOT_FOUND
            return
        }

        try {

            semesterService.save(semester)
        } catch (ValidationException e) {
            respond semester.errors, view: 'create'
            return
        }

        redirect(view: 'index')
    }

    def update(Semester semester) {
        if (semester == null) {
            render status: HttpStatus.NOT_FOUND
            return
        }

        semesterService.save(semester)

        redirect(view: 'index')
    }

    def delete() {
        if (params.id == null) {
            render status: HttpStatus.NOT_FOUND
            return
        }

        long id = Long.valueOf(params.id)
        Semester semester = semesterService.get(id)
        if (semester.getModules() != null && !semester.getModules().isEmpty()) {
            throw new ValidationException("Das Semester kann nicht gelöscht werden. Es sind noch Module dazugehörig.", semester.errors)
        }
        semesterService.delete(id)
        redirect(view: 'index')
    }

}
