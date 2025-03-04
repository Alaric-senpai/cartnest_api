// const pool = require('../config/config');
const pool = require('../config/db.config')

class SystemAnalyticsVendors {
    static async getAll() {
        return await pool.query('SELECT * FROM system_analytics_vendors');
    }

    static async create({ vendor_id, amount_paid, date_paid }) {
        return await pool.query(
            'INSERT INTO system_analytics_vendors (vendor_id, amount_paid, date_paid) VALUES (?, ?, ?)',
            [vendor_id, amount_paid, date_paid]
        );
    }
}

module.exports = SystemAnalyticsVendors;
