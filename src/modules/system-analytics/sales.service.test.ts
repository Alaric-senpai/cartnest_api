import { beforeEach, describe, expect, it, vi } from 'vitest';

const findManyMock = vi.fn();
const createMock = vi.fn();

vi.mock('../../services/prisma.js', () => ({
  default: {
    systemAnalyticsSale: {
      findMany: findManyMock,
      create: createMock
    }
  }
}));

import { salesService } from './sales.service.js';

describe('salesService', () => {
  beforeEach(() => {
    findManyMock.mockReset();
    createMock.mockReset();
  });

  it('getAll returns success payload', async () => {
    findManyMock.mockResolvedValue([{ id: 10 }]);

    const result = await salesService.getAll();

    expect(findManyMock).toHaveBeenCalledWith({ orderBy: { id: 'desc' } });
    expect(result.success).toBe(true);
    expect(result.sales).toEqual([{ id: 10 }]);
  });

  it('create maps dto into prisma model', async () => {
    createMock.mockResolvedValue({ id: 99 });

    const result = await salesService.create({ order_id: 1, user_id: 2, amount: 300 });

    expect(createMock).toHaveBeenCalledWith({
      data: {
        orderId: 1,
        userId: 2,
        amountTaxed: 300
      }
    });
    expect(result).toEqual({
      message: 'Record Added successfully',
      insertId: 99,
      success: true
    });
  });
});
