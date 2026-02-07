const pool = require('../config/db.config');

class SystemAnalyticsSales {
  static async getAll() {
    const sales = await pool.query('SELECT * FROM system_analytics_sales ORDER BY id DESC');

    return {
      message: 'Sales record fetched',
      sales,
      success: true
    };
  }

  static async create({ order_id, user_id, amount }) {
    const add = await pool.query(
      'INSERT INTO system_analytics_sales (order_id, user_id, amount_taxed) VALUES (?, ?, ?)',
      [order_id, user_id, amount]
    );

    return {
      message: 'Record Added successfully',
      insertId: add.insertId,
      success: true
    };
  }
}

module.exports = SystemAnalyticsSales;
