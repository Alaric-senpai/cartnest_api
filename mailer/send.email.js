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

exports.WelcomeEmail = async(username, email, lastname)=>{
    try {
        
        const options = {
            from: 'ckagenou96@gmail.com',
            fromName: 'Cartnest Inc',
            to: email,
            text: `Welcome to CartNest!

Hi ${lastname},

We’re thrilled to have you on board! Your account has been successfully registered with the email address {{email}}. 

As a welcome gift, enjoy exclusive deals and discounts curated just for you.

Start shopping now by visiting: https://cartnest.site

If you have any questions, feel free to contact our support team at ckagenou96@gmail.com.

Happy Shopping!  
The CartNest Team
`,
            html: `<div style="background-color: #f9f9f9; padding: 20px; font-family: Arial, sans-serif;">
  <div style="background-color: #2a9df4; color: white; padding: 20px; text-align: center;">
    <h1 style="margin: 0; font-size: 28px;">Welcome to CartNest!</h1>
    <p style="font-size: 18px; margin: 10px 0;">Your shopping journey starts here.</p>
  </div>
  <div style="padding: 20px;">
    <h2 style="font-size: 22px; color: #333;">Hi ${username} ,</h2>
    <p style="font-size: 16px; color: #555;">We’re thrilled to have you on board! Your account has been successfully registered with the email address <strong> ${email} </strong>.</p>
    <p style="font-size: 16px; color: #555;">As a welcome gift, enjoy exclusive deals and discounts curated just for you.</p>
    <div style="text-align: center; margin: 20px 0;">
      <a href="https://cartnest.site" 
         style="display: inline-block; background-color: #ff6f61; color: white; text-decoration: none; padding: 10px 20px; font-size: 16px; border-radius: 5px;">
        Start Shopping Now
      </a>
    </div>
    <p style="font-size: 14px; color: #777;">If you have any questions, feel free to <a href="mailto:ckagenou96@gmail.com" style="color: #2a9df4;">contact our support team</a>.</p>
  </div>
  <div style="background-color: #333; color: white; padding: 10px; text-align: center;">
    <p style="font-size: 12px; margin: 0;">&copy; 2024 CartNest. All rights reserved.</p>
  </div>
</div>
`

        }
        await MailjetService.sendEmail(options)

        return{
            message: 'welcome email sent',
            success: true
        }

    } catch (error) {
        throw error
    }
}