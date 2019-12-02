package graded

import grails.gorm.services.Service

@Service(Dashboard)
interface DashboardService {

    Dashboard get(Serializable id)

    List<Dashboard> list(Map args)

    Long count()

    void delete(Serializable id)

    Dashboard save(Dashboard dashboard)

}