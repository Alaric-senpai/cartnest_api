const SystemAnalyticsSales = require('../models/systemAnalyticsSales');

exports.getAll = async (req, res) => {
    const data = await SystemAnalyticsSales.getAll();
    res.json(data);
};

exports.create = async (req, res) => {
    const result = await SystemAnalyticsSales.create(req.body);
    res.json({ success: true, insertId: result.insertId });
};
