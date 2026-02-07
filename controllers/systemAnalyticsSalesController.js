const SystemAnalyticsSales = require('../models/systemAnalyticsSales');

exports.getAll = async (req, res) => {
  try {
    const data = await SystemAnalyticsSales.getAll();
    return res.json(data);
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
};

exports.create = async (req, res) => {
  try {
    const result = await SystemAnalyticsSales.create(req.body);
    return res.status(201).json(result);
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
};
