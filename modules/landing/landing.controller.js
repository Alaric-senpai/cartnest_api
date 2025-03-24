
const landing = require('./landing.model');

exports.getLanding  =async (req, res)=>{
    try {
        
        const land = await landing.GetLandingInfo()

        return res.json(land)

    } catch (error) {

        return res.status(500).json(
            handleError(error)
        )
    }
}


exports.addLanding = async(req, res)=>{
    try {
        
        const { headline, subheadline, imagelink} = req.body

        const add = await landing.AddLandingInfo(headline,subheadline,imagelink)

        return res.json(add)

    } catch (error) {
        return res.status(500).json(
            handleError(error)
        )
    }
}


exports.ModifyLanding = async(req, res)=>{
    try {
        
        const {headline, subheadline, imagelink, recordid}=req.body

        
        const modify = await landing.modifyLandingPageRecord(headline, subheadline, imagelink, recordid)

        return res.json(modify)

    } catch (error) {
        return res.status(500).json(
            handleError(error)
        )
    }
}


exports.getRecordById = async(req, res)=>{

    try {
        
        const query = req.query

        const record = await landing.GetRecordInfo(query.record)

        return res.json(record)


    } catch (error) {
        return res.status(500).json(
            handleError(error)
        )
    }

}



 function handleError(error){
    return {
        message: 'error occured',
        success: false,
        error
    }
}