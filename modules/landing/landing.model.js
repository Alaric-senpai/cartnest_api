const pool = require('../../config/db.config')


exports.GetLandingInfo = async()=>{
    try {
        
        const conn = await pool.getConnection()

        const query = await conn.query("select * from landing_page_details order by id desc")

        await conn.release()

        if(!query){
            return { 
                message: 'Query error',
                success:false
            }
        }


        return{
            message: 'Landing Page Records fetched successfully',
            records: query[0],
            success:true
        }


    } catch (error) {
        throw error
    }
}

exports.GetRecordInfo = async(recordid)=>{
    try {
        
        const conn = await pool.getConnection()

        const query = await conn.query("select * from landing_page_details where id=?", [recordid])

        await conn.release()


        if(!query){
            return { 
                message: 'Query error',
                success:false
            }
        }

        return{
            message: 'Record fetched successfully',
            record: query,
            success:true
        }


    } catch (error) {
        throw error
    }
}



exports.AddLandingInfo = async(headline, subheadline, imagelink)=>{
    try {
        
        const conn = await pool.getConnection()

        const result = await conn.query("insert into landing_page_details(headline, subheadline, imagelink) values(?,?,?)", [headline, subheadline, imagelink])

        await conn.release()

        if(result){
            return {
                message: 'Record Added succesfully',
                success:true
            }
        }

        return {
            message: 'Record not added',
            success: false
        }


    } catch (error) {
        throw error
    }
}


exports.modifyLandingPageRecord = async(headline, subheadline, imagelink, id)=>{
    try {
        
        const conn = await pool.getConnection()

        const query = await conn.query("update landing_page_details set headline=?, subheadline=?, imagelink=? where id=?", [headline, subheadline, imagelink, id])


        await conn.release()

        if(!query){
            return {
                message: 'Record update failed',
                success: false
            }
        }

        return {
            message: 'Record Modifies successfully',
            success: true
        }

    } catch (error) {
        throw error        
    }
}