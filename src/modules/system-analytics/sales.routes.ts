import { Router } from 'express';
import { createSale, getAllSales } from './sales.controller.js';

const salesRouter = Router();

salesRouter.get('/', getAllSales);
salesRouter.post('/', createSale);

export default salesRouter;
