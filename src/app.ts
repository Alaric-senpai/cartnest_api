import express from 'express';
import helmet from 'helmet';
import cors from 'cors';
import rateLimit from 'express-rate-limit';
import salesRouter from './modules/system-analytics/sales.routes.js';

export const app = express();

const allowedOrigins = [
  'https://www.cartnest.site',
  'https://cartnest.site',
  'https://cartnest.vercel.app',
  'http://localhost:4200'
];

app.set('trust proxy', 1);
app.disable('x-powered-by');
app.use(helmet());
app.use(express.json({ limit: '1mb' }));
app.use(express.urlencoded({ extended: true, limit: '1mb' }));
app.use(
  cors({
    origin(origin, callback) {
      if (!origin || allowedOrigins.includes(origin)) {
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
    legacyHeaders: false
  })
);

app.get('/health', (_req, res) => {
  res.status(200).json({ status: 'ok' });
});

app.use('/cartnest/sales', salesRouter);

app.use((err: Error, _req: express.Request, res: express.Response, _next: express.NextFunction) => {
  res.status(500).json({ code: 'INTERNAL_SERVER_ERROR', message: err.message });
});
