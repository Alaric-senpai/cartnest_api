const LandingPageDetails = require('../models/landingPageDetails')

exports.getAll = async (req, res) => {
    const data = await LandingPageDetails.getAll();
    res.json(data);
};

exports.create = async (req, res) => {
    const result = await LandingPageDetails.create(req.body);
    res.json({ success: true, insertId: result.insertId });
};
