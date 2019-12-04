package graded

class Semester {

    SemesterTyp semesterTyp;
    int jahr;

    static hasMany = [modules: Modul]

    @Override
    String toString() {
        return semesterTyp.name() + ' ' + jahr
    }

    static mapping = {
        id generator:'sequence', params:[sequence_name:'semester_seq']
    }

    static constraints = {
        jahr(min: 10, max: 99)
    }


}
