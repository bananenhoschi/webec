package graded

class Modul {

    String kuerzel;

    String bezeichnung;

    String dozent;

    int credits;

    boolean hasMsp = true; // Default ist true, die meisten Module haben eine MSP

    boolean hasTestat = false;    // Default ist false, nur wenige Module haben eine Testat Arbeit

    boolean testatPassed;

    Note msp;

    static hasMany = [noten: Note]

    static belongsTo = [semester: Semester]

    boolean isCompleted() {
        return (hasMsp && msp) || hasTestat && testatPassed || !hasMsp && noten.findAll {
            it.note != null || it.note > 0
        }.size() == noten.size()
    }

    double getErfahrungsnote() {
        double en = 0
        for (Note note : noten) {
            if (note.note != null)
                en += (note.note * note.gewichtung)
        }
        return en
    }

    double getModulnote() {
        double modulnote = getErfahrungsnote()
        if (hasMsp && msp != null && msp.note > 0) {
            modulnote = Math.round((msp.note + modulnote) / 2 * 2) / 2
        }
        return modulnote
    }

    boolean isPassed() {
        return (hasMsp && msp && (3.75 <= getModulnote())) || testatPassed && hasTestat || !hasMsp && (3.75 <= getModulnote())
    }

    static constraints = {
        kuerzel(nullable: false)
        bezeichnung(nullable: true)
        dozent(nullable: true)
        msp(nullable: true)
        // Credits sind zwischen 2 für Kontext und 12 für IP6
        credits(min: 2, max: 12)
    }
}
