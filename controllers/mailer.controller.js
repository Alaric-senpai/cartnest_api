const mail = require('../mailer/send.email')
const authModel = require('../models/user.model')
// const express= require('express')


exports.resetPassword = async(req, res)=>{

    const params = req.query
    const email = params.email

    const code = await generateUniqueCode()
    console.log(code)

    try {
        

        const setToken = await authModel.storeToken(email, code)
        

        if(setToken.success){
            const sendemail = await mail.resetPassword(email, code)

            if(sendemail.success){
                return res.status(200).json(
                    {
                        message: sendemail.message,
                        success: sendemail.success
                    }
                )
            }
            return res.status(400).json(
                {
                    message: sendemail.message,
                    success: sendemail.success
                }
            )
        }

        return res.status(400).json(
            {
                message: setToken.message,
                success: setToken.success
            }
        )
    } catch (error) {
        return res.status(500).json(
            {
                message: 'Internal server error',
                error: error,
                success: false
            }
        )
    }


    
}



function generateUniqueCode() {
    const timestamp = Date.now();
    const randomPart = Math.floor(Math.random() * 10000).toString().padStart(4, '0');
    const uniqueCode = (timestamp % 100000000).toString().slice(-4) + randomPart;
    return parseInt(uniqueCode);
  }