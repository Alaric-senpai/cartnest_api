const MailjetService = require('./mailerjet.mailer')

exports.resetPassword = async(email, code)=>{
    console.log("From mailer.send");
    console.log(email)
    console.log(code)
    try {
        
        await MailjetService.sendPasswordResetEmail(email, code)

        return {
            message: 'Reset code sent',
            success:true
        }

    } catch (error) {
       throw error 
    }
}