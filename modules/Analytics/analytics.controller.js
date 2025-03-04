
const analyticsModel = require('./analytics.model')

async function ReturnAnalytics(req, res){

    if(req.user.userrole !== 'admin'){
        return res.status(401).json({
            message: 'Access level credentials not met',
            success:false
        })
    }

    try {
        
        const analytics = await analyticsModel.Analytics()

        if(analytics.success){
            return res.status(200).json(analytics)
        }

    } catch (error) {
        return res.status(500).json(
            {
                message: 'Internal server error',
                code: error.code,
                error:error.message
            }
        )
    }
}

module.exports = ReturnAnalytics