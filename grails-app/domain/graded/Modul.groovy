package graded

import grails.rest.Resource

@Resource(uri = '/module', formats = ['json'])
class Modul {

    String modulKuerzel;
    String modulBezeichnung;
    String dozent;
    int credits;

    boolean hasMsp;
    boolean isTestat;

    // static hasMany = [en: Note]
    // static hasOne = [msp: Note]

    static constraints = {
    }
}
