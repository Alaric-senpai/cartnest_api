const SystemAnalyticsVendors = require('../models/systemAnalyticsVendors');

exports.getAll = async (req, res) => {
    const data = await SystemAnalyticsVendors.getAll();
    res.json(data);
};

exports.create = async (req, res) => {
    const result = await SystemAnalyticsVendors.create(req.body);
    res.json({ success: true, insertId: result.insertId });
};
