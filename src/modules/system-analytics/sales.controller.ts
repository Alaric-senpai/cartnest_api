import type { Request, Response } from 'express';
import { salesService } from './sales.service.js';

export const getAllSales = async (_req: Request, res: Response) => {
  try {
    const data = await salesService.getAll();
    return res.json(data);
  } catch (error) {
    const message = error instanceof Error ? error.message : 'Unexpected error';
    return res.status(500).json({ success: false, message });
  }
};

export const createSale = async (req: Request, res: Response) => {
  try {
    const result = await salesService.create(req.body);
    return res.status(201).json(result);
  } catch (error) {
    const message = error instanceof Error ? error.message : 'Unexpected error';
    return res.status(500).json({ success: false, message });
  }
};
