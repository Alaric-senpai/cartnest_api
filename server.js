const express = require('express');
const dotenv = require('dotenv');
const helmet = require('helmet');
const cors = require('cors');
const rateLimit = require('express-rate-limit');

const treblle = require('@treblle/express')
// const app = express()



// Routes imports
const authRoutes = require('./routes/auth.routes');
const generalroutes = require('./routes/general.routes');
const brandRoutes = require('./routes/brands.routes');
const categoryRoutes = require('./routes/category.routes');
const shopRoutes = require('./routes/shop.routes');
const productRoutes = require('./routes/product.routes')
const orderRoutes = require('./routes/orders.routes')
const cartRoutes = require('./routes/carts.routes')
const mailerRoutes = require('./routes/mailer.routes')
// Server config
dotenv.config();
const app = express();
const port = process.env.PORT || 3500;

app.use(
    treblle({
      apiKey: process.env.TREBLLE_API_KEY || 'B9mW5zbcarNIlLxEZsSgtk8Lp9TtdN4PnXRIejHhp7YoQkNWh7XbRQ4ytFpuibjH',
      projectId: process.env.TREBLLE_PROJECT_ID || 'xEIrA9DWx6KSdi3',
      additionalFieldsToMask: [],
    })
  )
  

// Apply security headers with helmet
app.use(helmet());


const allowedOrigins = [
    'https://www.cartnest.site',
    'https://cartnest.site',
    'https://cartnest.vercel.app'
]

const corsOptions ={
    origin: function( origin, callback){
        if (allowedOrigins.includes(origin) || !origin){
            callback(null, true)
        } else{
            callback(new Error('Not allowed by cors'))
        }
    }
}

// Enable CORS with specific domain
// const corsOptions = {
//     origin: 'https://localhost:4200', // Replace with your frontend domain
//     optionsSuccessStatus: 200
// };
app.use(cors(corsOptions));

// Rate Limiting to prevent DoS attacks
// const apiLimiter = rateLimit({
//     windowMs: 1 * 60 * 1000, // 1 minutes
//     max: 100, // Limit each IP to 100 requests per window
//     message: 'Too many requests from this IP, please try again later'
// });
// app.use('/cartnest/', apiLimiter);

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
app.use('/cartnest/products', productRoutes);
app.use('/cartnest/orders', orderRoutes);
app.use('/cartnest/carts', cartRoutes);
// app.use('/cartnest/mail', mailerRoutes);
// Start the server
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
