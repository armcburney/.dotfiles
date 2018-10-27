/**
 * app.ts
 * Express server build with Pug, SASS, and TypeScript
 */

// Module imports
import * as express        from 'express';
import * as path           from 'path';
import * as favicon        from 'serve-favicon';
import * as logger         from 'morgan';
import * as bodyParser     from 'body-parser';
import * as sassMiddleware from 'node-sass-middleware';
import cookieParser = require('cookie-parser');

// Routes
import index from './routes/index';

// Init express app
const app: express.Express = express();

// Set views to Pug over plain HTML
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());

// Configure SASS
app.use(sassMiddleware({
  src: path.join(__dirname, 'public'),
  dest: path.join(__dirname, 'public'),
  indentedSyntax: true,
  sourceMap: true
}));

// Assets
app.use(express.static(path.join(__dirname, 'public')));

// Routes
app.use('/', index);

// Catch 404 and forward to error handler
app.use((req, res, next) => {
  var error = new Error('Not Found');
  error['status'] = 404;
  next(error);
});

// Error handler
app.use((error: any, req, res, next)  => {
  res.status(error['status'] || 500);

  res.render('error', {
    message: error.message,
    error: {}
  });

  return null;
});

export default app;
