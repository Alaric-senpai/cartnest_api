// const pool = require('../config/config');
const pool = require('../config/db.config')

class LandingPageDetails {
    static async getAll() {
        return await pool.query('SELECT * FROM landing_page_details');
    }

    static async getById(id) {
        return (await pool.query('SELECT * FROM landing_page_details WHERE id = ?', [id]))[0];
    }

    static async create({ headline, subheadline, imagelink }) {
        return await pool.query('INSERT INTO landing_page_details (headline, subheadline, imagelink) VALUES (?, ?, ?)', [headline, subheadline, imagelink]);
    }
}

module.exports = LandingPageDetails;
