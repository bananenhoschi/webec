package graded

class Modul {

    String modulKuerzel;
    String modulBezeichnung;
    String dozent;
    int credits;

    // Default ist true, die meisten Module haben eine MSP
    boolean hasMsp = true;
    // Default ist false, nur wenige Module haben eine Testat Arbeit
    boolean isTestat = false;
    boolean hasTestat = false;

    Set<Note> ens = new HashSet<>()
    Note msp;

    static belongsTo = [semester: Semester]


    boolean completed() {
        return hasMsp && !msp || isTestat && hasTestat
    }

    double erfahrungsnote() {
        double en = 0
        for (Note note : ens) {
            en += (note.note * note.gewichtung)
        }
        return en
    }

    double modulnote() {
        double modulnote = erfahrungsnote()
        if (hasMsp && msp != null && msp.note > 0) {
            modulnote = Math.round((msp.note + modulnote) / 2 * 2) / 2
        }
        return modulnote
    }

    boolean passed() {
        return (hasMsp && msp && (3.75 <= modulnote())) || isTestat && hasTestat
    }

    static constraints = {

        // Mindestens das Modulkürzel muss erfasst sein
        modulKuerzel(nullable: false)
        modulBezeichnung(nullable: true)
        dozent(nullable: true)
        msp(nullable: true)
        ens(nullable: true)
        // Credits sind zwischen 2 für Kontext und 12 für IP6
        credits(min: 2, max: 12)
    }
}
