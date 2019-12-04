package graded

import grails.gorm.services.Service

@Service(Semester)
interface SemesterService {

    Semester findByJahrAndSemesterTyp(int jahr, SemesterTyp semesterTyp)

}