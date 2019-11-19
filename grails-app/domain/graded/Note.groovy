package graded

class Note {

    double note;
    
    // Gewichtung in Prozent Werten
    double gewichtung;

    static constraints = {
        gewichtung(min: 0.0, max: 1.0)
        note(min: 1.0, max: 6.0)
    }
}
