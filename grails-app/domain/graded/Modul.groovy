package graded

class Modul {

    String kuerzel;

    String bezeichnung;

    String dozent;

    int credits;

    Integer anzahlNoten;

    boolean hasMsp = true; // Default ist true, die meisten Module haben eine MSP

    boolean hasTestat = false;    // Default ist false, nur wenige Module haben eine Testat Arbeit

    boolean testatPassed;

    boolean angerechnet;

    Note msp;

    static hasMany = [noten: Note]

    static belongsTo = [semester: Semester]


    boolean isCompleted() {
        return angerechnet || (testatPassed && hasTestat) || (hasMsp && msp != null && msp.getNote() != null) || (!hasMsp && noten != null && !noten.any {
            it.getNote() != null && it.getNote() > 0
        } && noten.size() == anzahlNoten)
    }

    double getErfahrungsnote() {
        double en = 0

        if (noten == null) return en

        for (Note note : noten) {
            if (note.note != null)
                en += (note.note)
        }
        return (Math.round((en / noten.size()) * 10)) / 10
    }

    double getModulnote() {
        double modulnote = getErfahrungsnote()
        if (hasMsp && msp != null && msp.note > 0) {
            modulnote = Math.round((msp.note + modulnote) / 2 * 2) / 2
        }
        return modulnote
    }

    boolean isPassed() {
        return angerechnet || (testatPassed && hasTestat) || (hasMsp && msp != null && getModulnote() >= 3.75) || (!hasMsp && getModulnote() >= 3.75)
    }

    static mapping = {
        id generator: 'sequence', params: [sequence_name: 'modul_seq']
    }

    static constraints = {
        kuerzel(nullable: false)
        bezeichnung(nullable: true)
        dozent(nullable: true)
        msp(nullable: true)
        credits(min: 2, max: 12) // Credits sind zwischen 2 für Kontext und 12 für IP6
    }

}
