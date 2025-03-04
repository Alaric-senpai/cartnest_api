
const jwt = require('jsonwebtoken')
const envConfig = require('../env.config')
function verifyAdmin(req, res, next){
    const adminHeader = req.headers['admtkn']

    const AdminToken = adminHeader && adminHeader.split(' ')[1]

    console.log('admin token', adminHeader)

    if(!AdminToken){
        return res.status(401).json({
            message: 'Access level credentials not met'
        })
    }

    jwt.verify(adminHeader, envConfig.ADMIN_HASH_KEY, (err, user) =>{

        if(err){
            return res.status(401).json({
                message: 'Admin access Key is expired',
                success: false
            })
        }

        req.admin = user
        next()
    } )

}

exports.verify = verifyAdmin