const express = require('express');
const dotenv = require('dotenv');
const helmet = require('helmet');
const cors = require('cors');
const rateLimit = require('express-rate-limit');

// Routes imports
const authRoutes = require('./routes/auth.routes');
const generalroutes = require('./routes/general.routes');
const brandRoutes = require('./routes/brands.routes');
const categoryRoutes = require('./routes/category.routes');
const shopRoutes = require('./routes/shop.routes');
const productRoutes = require('./routes/product.routes')

// Server config
dotenv.config();
const app = express();
const port = process.env.PORT || 3000;

// Apply security headers with helmet
app.use(helmet());

// Enable CORS with specific domain
// const corsOptions = {
//     origin: 'https://localhost:3500', // Replace with your frontend domain
//     optionsSuccessStatus: 200
// };
// app.use(cors(corsOptions));

// Rate Limiting to prevent DoS attacks
const apiLimiter = rateLimit({
    windowMs: 1 * 60 * 1000, // 1 minutes
    max: 100, // Limit each IP to 100 requests per window
    message: 'Too many requests from this IP, please try again later'
});
app.use('/cartnest/', apiLimiter);

// Limit payload size
app.use(express.json());

// Disable x-powered-by header
// app.disable('x-powered-by');

// Server routes
app.use('/cartnest/auth', authRoutes);
app.use('/cartnest/general', generalroutes);
app.use('/cartnest/brands', brandRoutes);
app.use('/cartnest/categories', categoryRoutes);
app.use('/cartnest/shops', shopRoutes);
app.use('/cartnest/products', productRoutes)
// Start the server
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
