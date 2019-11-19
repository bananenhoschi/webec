package graded

import grails.rest.Resource

@Resource(uri = '/module', formats = ['json'])
class Modul {

    String modulKuerzel;
    String modulBezeichnung;
    String dozent;
    int credits;

    // Default ist true, die meisten Module haben eine MSP
    boolean hasMsp = true;
    // Default ist false, nur wenige Module haben eine Testat Arbeit
    boolean isTestat = false;

    // static hasMany = [en: Note]
    // static hasOne = [msp: Note]

    static constraints = {
        // Mindestens das Modulkürzel muss erfasst sein
        modulKuerzel(nullable: false)
        // Credits sind zwischen 2 für Kontext und 12 für IP6
        credits(min: 2, max: 12)
    }
}
