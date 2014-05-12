package logging

import java.util.concurrent.atomic.AtomicLong
/*
*Also possible to Intercept individual Controller by using beforeInterceptor of every controller
*http://grails.org/doc/2.3.x/guide/theWebLayer.html
*7.1.5 Controller Interceptors
*/
class ActionLogFilters {
    private static final AtomicLong REQUEST_NUMBER_COUNTER = new AtomicLong()
    private static final String START_TIME_ATTRIBUTE = 'Controller__START_TIME__'
    private static final String REQUEST_NUMBER_ATTRIBUTE = 'Controller__REQUEST_NUMBER__'

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                return true
                println("this on before")
                if (!log.debugEnabled) return true
                long start = System.currentTimeMillis()
                long currentRequestNumber = REQUEST_NUMBER_COUNTER.incrementAndGet()

                request[START_TIME_ATTRIBUTE] = start
                request[REQUEST_NUMBER_ATTRIBUTE] = currentRequestNumber
                log.error "preHandle request #$currentRequestNumber : " + "'$request.servletPath'/'$request.forwardURI', " + "from $request.remoteHost ($request.remoteAddr) " + " at ${new Date()}, Ajax: $request.xhr, controller: $controllerName, " + "action: $actionName, params: ${new TreeMap(params)}"

                return true
            }
            after = { Map model ->
                return true
                if (!log.debugEnabled) return true
                long start = request[START_TIME_ATTRIBUTE]
                long end = System.currentTimeMillis()
                long requestNumber = request[REQUEST_NUMBER_ATTRIBUTE]
                def msg = "postHandle request #$requestNumber: end ${new Date()}, " +
                        "controller total time ${end - start}ms"
                if (log.traceEnabled) {
                    log.trace msg + "; model: $model"
                }
                else {
                    log.error msg
                }
            }
            afterView = { Exception e ->

            }
        }
    }
}
