package graded

import grails.gorm.transactions.Transactional

@Transactional
class ModulService {

    def save(modul){
        modul.save()
    }

    def list() {
        Modul.findAll()
    }
}
