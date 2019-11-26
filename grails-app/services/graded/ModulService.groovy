package graded

import grails.gorm.services.Service

@Service(Modul)
interface ModulService {

    Modul get(Serializable id)

    List<Modul> list(Map args)

    Long count()

    void delete(Serializable id)

    Modul save(Modul modul)

}