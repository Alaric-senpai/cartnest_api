const jwt = require('jsonwebtoken');


function verifyVendor(req, res, next){

    const tokenheaders = req.headers['shoptoken']
    const shoptoken = tokenheaders && tokenheaders.split(' ')[1];

    if(!shoptoken){
        return res.status(401).json({
            message: 'Access denied . No token provided',
            success:false
        })
    }

    jwt.verify(shoptoken, process.env.JWT_SECRET, 
        (err, shop) =>{
            if(err){
                return res.status(
                    {
                        message: "Invalid or expired token",
                        success:false
                    }
                )
            }

            req.shop = shop
            next()
        }
    )

}

exports.VerifyVendor = verifyVendor