const express = require('express');
const helmet = require('helmet');
const cors = require('cors');
const rateLimit = require('express-rate-limit');

// Routes imports
const authRoutes = require('./routes/auth.routes');
const generalroutes = require('./routes/general.routes');
const brandRoutes = require('./routes/brands.routes');
const categoryRoutes = require('./routes/category.routes');
const shopRoutes = require('./routes/shop.routes');
const productRoutes = require('./routes/product.routes');
const orderRoutes = require('./routes/orders.routes');
const cartRoutes = require('./routes/carts.routes');
const AnalyticsRoutes = require('./routes/analytics.routes');
const envConfig = require('./env.config');
const landingPageRoutes = require('./routes/landingPageRoutes');
const systemAnalyticsSalesRoutes = require('./routes/systemAnalyticsSalesRoutes');
const systemAnalyticsVendorsRoutes = require('./routes/systemAnalyticsVendorRoutes');
const pool = require('./config/db.config');

const app = express();
const port = Number(envConfig.PORT) || 3000;

app.set('trust proxy', 1);
app.disable('x-powered-by');

app.use(helmet());

const allowedOrigins = [
  'https://www.cartnest.site',
  'https://cartnest.site',
  'https://cartnest.vercel.app',
  'http://localhost:4200'
];

app.use(
  cors({
    origin(origin, callback) {
      if (allowedOrigins.includes(origin) || !origin) {
        callback(null, true);
        return;
      }
      callback(new Error('Not allowed by cors'));
    }
  })
);

app.use(
  '/cartnest/',
  rateLimit({
    windowMs: 60 * 1000,
    max: 300,
    standardHeaders: true,
    legacyHeaders: false,
    message: 'Too many requests from this IP, please try again later'
  })
);

app.use(express.json({ limit: '1mb' }));
app.use(express.urlencoded({ extended: true, limit: '1mb' }));

app.use((req, res, next) => {
  console.log(JSON.stringify({
    event: 'request',
    method: req.method,
    path: req.originalUrl,
    host: req.hostname,
    ip: req.ip
  }));
  next();
});

app.get('/health', (req, res) => {
  res.status(200).json({ status: 'ok' });
});

app.get('/ready', async (req, res) => {
  try {
    const conn = await pool.getConnection();
    await conn.query('SELECT 1');
    conn.release();
    res.status(200).json({ status: 'ready' });
  } catch (error) {
    res.status(503).json({ status: 'not-ready', error: error.message });
  }
});

app.use('/cartnest/auth', authRoutes);
app.use('/cartnest/general', generalroutes);
app.use('/cartnest/brands', brandRoutes);
app.use('/cartnest/categories', categoryRoutes);
app.use('/cartnest/shops', shopRoutes);
app.use('/cartnest/products', productRoutes);
app.use('/cartnest/orders', orderRoutes);
app.use('/cartnest/carts', cartRoutes);
app.use('/cartnest/analytics', AnalyticsRoutes);
app.use('/cartnest/landing', landingPageRoutes);
app.use('/cartnest/sales', systemAnalyticsSalesRoutes);
app.use('/cartnest/system-analytics-vendors', systemAnalyticsVendorsRoutes);

app.use((err, req, res, next) => {
  console.error(err);
  res.status(500).json({
    code: 'INTERNAL_SERVER_ERROR',
    message: 'An unexpected error occurred'
  });
});

const server = app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

const gracefulShutdown = async () => {
  console.log('Received shutdown signal. Closing server...');
  server.close(async () => {
    await pool.end();
    process.exit(0);
  });
};

process.on('SIGINT', gracefulShutdown);
process.on('SIGTERM', gracefulShutdown);

module.exports = app;
