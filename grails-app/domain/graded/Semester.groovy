package graded

class Semester {

    SemesterTyp semesterTyp;

    int jahr;

    static hasMany = [modules: Modul]

    static mapping = {
        id generator: 'sequence', params: [sequence_name: 'semester_seq']
    }

    static constraints = {
        jahr(min: 10, max: 99)
    }

    @Override
    String toString() {
        return semesterTyp == null ? '' : semesterTyp == SemesterTyp.VOR ? semesterTyp.getName() : semesterTyp.getName() + ' ' + jahr
    }

}
