import { describe, expect, it } from 'vitest';
import prismaA, { prisma as prismaB } from './prisma.js';

describe('prisma service singleton', () => {
  it('exports the same Prisma client instance', () => {
    expect(prismaA).toBe(prismaB);
  });
});
