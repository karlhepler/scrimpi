module.exports = (app) -> 
  
  # INDEX
  app.all '/', (req, res, next) ->
    routeREST('index', 'index', req, res, next)

  # STANDARD ROUTES
  app
    .get    '/:controller',     (req, res, next) -> routeREST( req.params.controller, 'index',  req, res, next )
    .get    '/:controller/:id', (req, res, next) -> routeREST( req.params.controller, 'get',    req, res, next )
    .put    '/:controller/:id', (req, res, next) -> routeREST( req.params.controller, 'modify', req, res, next )
    .post   '/:controller',     (req, res, next) -> routeREST( req.params.controller, 'create', req, res, next )
    .delete '/:controller/:id', (req, res, next) -> routeREST( req.params.controller, 'delete', req, res, next )

  # If all else failed, show 404 page
  app.all '/*', (req, res, next) ->
    err = new Error('Not Found');
    err.status = 404;
    next(err);

# render the page based on controller name, method and id
routeREST = (controllerName, methodName, req, res, next) ->
  controllerName = 'index' if not controllerName?
  controller = null
  try
    controller = require "./controllers/" + controllerName
  catch e
    console.warn "controller not found: " + controllerName, e
    next()
    return
  data = null
  if typeof controller[methodName] is 'function'
    actionMethod = controller[methodName].bind controller
    actionMethod req, res, next
  else
    console.warn 'method not found: ' + methodName
    next()