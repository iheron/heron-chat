require! {
  path
  express
}

app = express()
# options
app.enable "case sensitive routing"
# all
app.set "views", (path.join __dirname, "../views")
app.set "view engine", "hjs"
app.set "layout", "partials/_layout"
app.use express.static path.join(__dirname, "../public")

app.engine "hjs", require "hogan-express"

app.use '/', (req, res, next) ->
  res.render 'home/index', {}

module.exports = app



