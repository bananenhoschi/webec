package graded

import grails.gorm.services.Service

@Service(Modul)
interface ModulService {
    Modul save(String modulKuerzel, int credits)
}
