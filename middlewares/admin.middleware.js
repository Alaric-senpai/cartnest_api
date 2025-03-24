
const jwt = require('jsonwebtoken')
const envConfig = require('../env.config')
function verifyAdmin(req, res, next){
    
    const user = req.user

    if(user.userrole !== 'admin'){
        return res.status(401).json({
            message: 'Access level requirements not met',
            success:false

        }
        )
    }

    next()

}

exports.verify = verifyAdmin