const dotenv = require("dotenv");

// import 

// Load environment variables from .env file
dotenv.config();

const envConfig = {
  PORT: process.env.PORT,
  JWT_SECRET: process.env.JWT_SECRET,
  EMAIL_USER: process.env.EMAIL_USER,
  EMAIL_PASS: process.env.EMAIL_PASS,
  RESEND_API_KEY: process.env.RESEND_API_KEY,
  TREBLLE_API_KEY:process.env.TREBLLE_API_KEY,
  TREBLLE_PROJECT_ID: process.env.TREBLLE_PROJECT_ID,
  ADMIN_HASH_KEY:process.env.ADMIN_HASH_KEY,
  REFRESH_HASH_KEY:process.env.REFRESH_HASH_KEY,
  DB_HOST:process.env.DB_HOST,
  DB_DATABASE:process.env.DB_DATABASE,
  DB_PASSWORD:process.env.DB_PASSWORD,
  DB_USERNAME:process.env.DB_USERNAME

};

module.exports = envConfig;
