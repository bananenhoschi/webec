package graded

import grails.gorm.services.Service
import grails.gorm.transactions.Transactional

@Service(Semester)
interface SemesterService {

    Semester findByJahrAndSemesterTyp(int jahr, SemesterTyp semesterTyp)

    Semester get(Serializable id)

    List<Semester> list(Map args)

    Long count()

    void delete(Serializable id)

    Semester save(Semester semester)

}