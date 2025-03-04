// const pool = require('../config/config');
const pool = require('../config/db.config')

class SystemAnalyticsSales {
    static async getAll() {
        return await pool.query('SELECT * FROM system_analytics_sales');
    }

    static async create({ order_id, ref, user_id, amount, taxed }) {
        return await pool.query(
            'INSERT INTO system_analytics_sales (order_id, ref, user_id, amount, taxed) VALUES (?, ?, ?, ?, ?)',
            [order_id, ref, user_id, amount, taxed]
        );
    }
}

module.exports = SystemAnalyticsSales;
