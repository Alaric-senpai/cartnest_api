const mailerjetMailer = require('./mailerjet.mailer');
const MailjetService = require('./mailerjet.mailer')

exports.resetPassword = async(email, code)=>{
    // console.log("From mailer.send");
    // console.log(email)
    // console.log(code)
    try {
        
        // await MailjetService.sendPasswordResetEmail(email, code)
        const options ={
            from: "ckagenou96@gmail.com",
            fromName: "Cartnest Inc",
            to: email,
            toName: 'Concerned user',
            subject: `Password reset code `,
            text: `Hello cartnest Member here is the password reset code you requested ${code}. If you did not request this Kindly ignore it and DO NOT share it`,
            html: `<h5>Hello Hello cartnest Member here is the password reset code you requested</h5> <h1> ${code} </h1> <p>
             If you did not request this Kindly ignore it and DO NOT share it</p>`
        }
        await MailjetService.sendEmail(options)

        return {
            message: 'Reset code sent',
            success:true
        }

    } catch (error) {
       throw error 
    }
}
