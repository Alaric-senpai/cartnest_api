const express = require('express');
const dotenv = require('dotenv');
const helmet = require('helmet');
const cors = require('cors');
const rateLimit = require('express-rate-limit');
// const EnvConfig = require('./env.config')
const treblle = require('@treblle/express')



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
const AnalyticsRoutes = require('./routes/analytics.routes');
const envConfig = require('./env.config');
const landingPageRoutes = require('./routes/landingPageRoutes');
const systemAnalyticsSalesRoutes = require('./routes/systemAnalyticsSalesRoutes');
const systemAnalyticsVendorsRoutes = require('./routes/systemAnalyticsVendorRoutes');


// Server config
const app = express();
const port = envConfig.PORT ;

// app.use(
//     treblle({
//       apiKey: envConfig.TREBLLE_API_KEY, 
//       projectId: envConfig.TREBLLE_PROJECT_ID,
//       additionalFieldsToMask: [],
//     })
//   )
  

// Apply security headers with helmet
// app.use(helmet());


const allowedOrigins = [
    'https://www.cartnest.site',
    'https://cartnest.site',
    'https://cartnest.vercel.app',
    'http://localhost:4200'
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
const apiLimiter = rateLimit({
    windowMs: 1 * 60 * 1000, // 1 minutes
    max: 200, // Limit each IP to 100 requests per window
    message: 'Too many requests from this IP, please try again later',
    
});
app.use('/cartnest/', apiLimiter);

app.use('/', mapRequests)

function mapRequests(req, res, next){




    console.log('A new request for', req.originalUrl, 'issued from host', req.hostname, 'ip address', req.ip)
    next()
    // console.log(res)

}


// Limit payload size
app.use(express.json());
app.use(express.urlencoded({ extended: true })); // For form data
// Disable x-powered-by header
app.disable('x-powered-by');

// Server routes
app.use('/cartnest/auth', authRoutes);
app.use('/cartnest/general', generalroutes);
app.use('/cartnest/brands', brandRoutes);
app.use('/cartnest/categories', categoryRoutes);
app.use('/cartnest/shops', shopRoutes);
app.use('/cartnest/products', productRoutes);
app.use('/cartnest/orders', orderRoutes);
app.use('/cartnest/carts', cartRoutes);
app.use('/cartnest/analytics', AnalyticsRoutes)
app.use('/cartnest/landing', landingPageRoutes);
app.use('/cartnest/sales', systemAnalyticsSalesRoutes);
app.use('/cartnest/system-analytics-vendors', systemAnalyticsVendorsRoutes);


// app.use('/cartnest/mail', mailerRoutes);
// Start the server
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
