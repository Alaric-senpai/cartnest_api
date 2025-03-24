// const pool = require('../config/config');
const pool = require('../config/db.config')

class SystemAnalyticsSales {
    static async getAll() {
        const sales = await pool.query('SELECT * FROM system_analytics_sales');

        if(!sales){
            return{
                message: 'Query error',
                success: false
            }
        }

        return {
            message: 'Sales record fetched',
            sales,
            success:true
        }
    }

    static async create({ order_id,  user_id, amount }) {
        const add =  await pool.query(
            'INSERT INTO system_analytics_sales (order_id, user_id, amount_taxed) VALUES (?, ?, ?, )',
            [order_id, user_id, amount]
        );


        if(!add){
            return {
                message :'Query error',
                success:false
            }
        }

        return {
            message: 'Record Added successfully',
            success:true
        }
    }
}

module.exports = SystemAnalyticsSales;
