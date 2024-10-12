const jwt = require('jsonwebtoken');

function verifyToken(req, res, next) {
    // Get header
    const authHeader = req.headers['authorization'];

    // Split bearer token
    const token = authHeader && authHeader.split(' ')[1];

    if (!token) {
        return res.status(401).json({ message: 'Access denied. No token provided', success: false });
    }

    jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
        if (err) {
            return res.status(403).json({ message: 'Invalid or expired token', success: false });
        }

        req.user = user; // Attach the decoded user to the request object
        next(); // Call the next middleware/controller
    });
}

exports.verify = verifyToken;
