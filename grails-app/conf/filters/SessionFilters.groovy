package filters

class SessionFilters {

    def filters = {
        all(controller: '*', action: '*') {
            before = {
                if(session.user == null && controllerName in ['management','post','reply'] && !(actionName in ['index','show'])){
                    redirect(uri: '/login')
                    return false
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
