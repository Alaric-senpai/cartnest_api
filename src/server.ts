import 'dotenv/config';
import { app } from './app.js';
import prisma from './services/prisma.js';

const port = Number(process.env.PORT ?? 3000);

const server = app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

const gracefulShutdown = async () => {
  server.close(async () => {
    await prisma.$disconnect();
    process.exit(0);
  });
};

process.on('SIGINT', gracefulShutdown);
process.on('SIGTERM', gracefulShutdown);
