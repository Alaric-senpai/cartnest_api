import prisma from '../../services/prisma.js';

export interface CreateSaleInput {
  order_id: number;
  user_id: number;
  amount: number;
}

export const salesService = {
  async getAll() {
    const sales = await prisma.systemAnalyticsSale.findMany({
      orderBy: { id: 'desc' }
    });

    return {
      message: 'Sales record fetched',
      sales,
      success: true
    };
  },

  async create(input: CreateSaleInput) {
    const record = await prisma.systemAnalyticsSale.create({
      data: {
        orderId: input.order_id,
        userId: input.user_id,
        amountTaxed: input.amount
      }
    });

    return {
      message: 'Record Added successfully',
      insertId: record.id,
      success: true
    };
  }
};
