const Resend = require('resend');
const envConfig = require('../../env.config');

if (!envConfig.RESEND_API_KEY) {
    throw new Error('RESEND_API_KEY is missing from environment variables');
}

const mailer = new Resend.Resend(envConfig.RESEND_API_KEY);

// Welcome Email Template
const generateWelcomeEmail = (userName) => `
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to CartNest</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; }
        .container { max-width: 600px; margin: 20px auto; background: #fff; border-radius: 8px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); overflow: hidden; }
        .header { background: #4CAF50; color: #fff; text-align: center; padding: 15px; font-size: 24px; }
        .content { padding: 20px; color: #333; text-align: center; }
        .btn { display: inline-block; background: #4CAF50; color: #fff; padding: 12px 20px; text-decoration: none; border-radius: 5px; margin-top: 20px; }
        .footer { background: #f4f4f4; text-align: center; padding: 10px; font-size: 12px; color: #666; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">Welcome to CartNest! 🎉</div>
        <div class="content">
            <p>Hi <strong>${userName}</strong>,</p>
            <p>We're thrilled to have you join <strong>CartNest</strong>! Your journey to seamless shopping starts now.</p>
            <a href="https://www.cartnest.site/dashboard" class="btn">Start Shopping</a>
            <p>Need help? Our support team is here for you.</p>
        </div>
        <div class="footer">&copy; 2025 CartNest. All rights reserved. <br> <a href="https://www.cartnest.site">Visit CartNest</a></div>
    </div>
</body>
</html>`;

// Login Alert Email Template
const generateLoginAlertEmail = (userName, ipAddress, deviceInfo, loginTime) => `
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CartNest Login Alert</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; }
        .container { max-width: 600px; margin: 20px auto; background: #fff; border-radius: 8px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); overflow: hidden; }
        .header { background: #FF5733; color: #fff; text-align: center; padding: 15px; font-size: 20px; }
        .content { padding: 20px; color: #333; }
        .info { background: #f8f8f8; padding: 10px; border-left: 4px solid #FF5733; margin: 20px 0; }
        .btn { display: inline-block; background: #FF5733; color: #fff; padding: 12px 20px; text-decoration: none; border-radius: 5px; margin-top: 20px; }
        .footer { background: #f4f4f4; text-align: center; padding: 10px; font-size: 12px; color: #666; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">CartNest Login Alert 🚨</div>
        <div class="content">
            <p>Dear <strong>${userName}</strong>,</p>
            <p>We detected a login attempt to your CartNest account from the following details:</p>
            <div class="info">
                <p><strong>IP Address:</strong> ${ipAddress}</p>
                <p><strong>Device:</strong> ${deviceInfo}</p>
                <p><strong>Time:</strong> ${loginTime}</p>
            </div>
            <p>If this was you, ignore this email. If not, update your password immediately.</p>
            <a href="https://www.cartnest.site/reset" class="btn">Secure Your Account</a>
        </div>
        <div class="footer">&copy; 2025 CartNest. All rights reserved. <br> <a href="https://www.cartnest.site">Visit CartNest</a></div>
    </div>
</body>
</html>`;


// Reset Password Email Template
const generateResetPasswordEmail = (userName, resetToken) => `
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Your Password - CartNest</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; }
        .container { max-width: 600px; margin: 20px auto; background: #fff; border-radius: 8px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); overflow: hidden; }
        .header { background: #007bff; color: #fff; text-align: center; padding: 15px; font-size: 20px; }
        .content { padding: 20px; color: #333; text-align: center; }
        .token-box { background: #f8f8f8; padding: 15px; border: 2px dashed #007bff; font-size: 18px; font-weight: bold; color: #007bff; display: inline-block; margin: 20px auto; }
        .footer { background: #f4f4f4; text-align: center; padding: 10px; font-size: 12px; color: #666; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">Reset Your Password 🔒</div>
        <div class="content">
            <p>Hi <strong>${userName}</strong>,</p>
            <p>You requested to reset your password for your CartNest account.</p>
            <p>Use the token below to proceed with resetting your password:</p>
            <div class="token-box">${resetToken}</div>
            <p>If you didn't request this, please ignore this email. Your password will remain unchanged.</p>
        </div>
        <div class="footer">&copy; 2025 CartNest. All rights reserved. <br> <a href="https://www.cartnest.site">Visit CartNest</a></div>
    </div>
</body>
</html>`;


//password reset successfull email
const generatePasswordResetSuccessEmail = (userName) => `
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Reset Successful</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; }
        .container { max-width: 600px; margin: 20px auto; background: #fff; border-radius: 8px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); overflow: hidden; }
        .header { background: #28a745; color: #fff; text-align: center; padding: 15px; font-size: 20px; }
        .content { padding: 20px; color: #333; text-align: center; }
        .footer { background: #f4f4f4; text-align: center; padding: 10px; font-size: 12px; color: #666; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">Password Reset Successful ✅</div>
        <div class="content">
            <p>Hi <strong>${userName}</strong>,</p>
            <p>Your password has been successfully reset.</p>
            <p>If you didn't request this change, please contact support immediately.</p>
            <p>Stay safe,</p>
            <p><strong>The CartNest Team</strong></p>
        </div>
        <div class="footer">&copy; 2025 CartNest. All rights reserved. <br> <a href="https://www.cartnest.site">Visit CartNest</a></div>
    </div>
</body>
</html>`;


const generateOrderCompletedEmail = (email, paymentMethod, paymentCode, shippingCode, deliveryMethod, price) => `
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Completed Successfully</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; }
        .container { max-width: 600px; margin: 20px auto; background: #fff; border-radius: 8px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); overflow: hidden; }
        .header { background: #4CAF50; color: #fff; text-align: center; padding: 15px; font-size: 22px; font-weight: bold; }
        .content { padding: 20px; color: #333; text-align: center; }
        .info { background: #f8f8f8; padding: 15px; border-left: 4px solid #4CAF50; margin: 20px 0; text-align: left; }
        .footer { background: #f4f4f4; text-align: center; padding: 10px; font-size: 12px; color: #666; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">🎉 Order Completed Successfully! 🎉</div>
        <div class="content">
            <p>Dear <strong>${email}</strong>,</p>
            <p>Your order has been successfully processed. Below are the details of your purchase:</p>
            <div class="info">
                <p><strong>Payment Method:</strong> ${paymentMethod}</p>
                <p><strong>Payment Code:</strong> ${paymentCode}</p>
                <p><strong>Shipping Code:</strong> ${shippingCode}</p>
                <p><strong>Delivery Method:</strong> ${deliveryMethod}</p>
                <p><strong>Total Price:</strong> $${price}</p>
            </div>
            <p>Thank you for shopping with <strong>CartNest</strong>. We appreciate your business!</p>
        </div>
        <div class="footer">&copy; 2025 CartNest. All rights reserved. <br> <a href="https://www.cartnest.site">Visit CartNest</a></div>
    </div>
</body>
</html>`;

exports.sendOrderCompletedEmail = async (to, paymentMethod, paymentCode, shippingCode, deliveryMethod, price) => {
    try {
        const { data, error } = await mailer.emails.send({
            from: 'CartNest <no-reply@cartnest.site>',
            to,
            subject: '🎉 Your Order is Complete!',
            html: generateOrderCompletedEmail(to, paymentMethod, paymentCode, shippingCode, deliveryMethod, price),
        });

        return error ? { success: false, message: 'Error sending order completed email', error } 
                     : { success: true, message: 'Order completed email sent successfully', data };
    } catch (err) {
        return { success: false, message: 'Unexpected error', error: err };
    }
};




//account password reset succesfull
exports.sendPasswordResetSuccess = async (to, name) => {
    try {
        const { data, error } = await mailer.emails.send({
            from: 'Security <security@cartnest.site>',
            to,
            subject: 'Your Password Has Been Reset',
            html: generatePasswordResetSuccessEmail(name),
        });

        return error ? { success: false, message: 'Error sending password reset success email', error } 
                     : { success: true, message: 'Password reset success email sent successfully', data };
    } catch (err) {
        return { success: false, message: 'Unexpected error', error: err };
    }
};



// Send Reset Password Email
exports.sendResetPasswordEmail = async (email, name, resetToken) => {
    try {
        const { error } = await mailer.emails.send({
            from: 'Cartnest <support@cartnest.site>',
            to: email,
            subject: 'Reset Your Password - CartNest',
            html: generateResetPasswordEmail(name, resetToken),
        });

        return error ? { success: false, message: 'Error sending reset password email', error } 
                     : { success: true, message: 'Reset password email sent successfully' };
    } catch (err) {
        return { success: false, message: 'Unexpected error', error: err.message };
    }
};


// Send Welcome Email
exports.sendWelcomeEmail = async (to, name) => {
    try {
        const { error } = await mailer.emails.send({
            from: 'Cartnest <welcome@cartnest.site>',
            to,
            subject: 'Welcome to CartNest!',
            html: generateWelcomeEmail(name),
        });

        return error ? { success: false, message: 'Error sending welcome email', error } 
                     : { success: true, message: 'Welcome email sent successfully' };
    } catch (err) {
        return { success: false, message: 'Unexpected error', error: err.message };
    }
};

// Send Login Alert Email
exports.sendLoginAlert = async (email, name, ip, device) => {
    try {
        const loginTime = new Date().toLocaleString();
        const { error } = await mailer.emails.send({
            from: 'Security <security@cartnest.site>',
            to: email,
            subject: 'Login Alert - CartNest',
            html: generateLoginAlertEmail(name, ip, device, loginTime),
        });

        return error ? { success: false, message: 'Error sending login alert', error } 
                     : { success: true, message: 'Login alert email sent successfully' };
    } catch (err) {
        return { success: false, message: 'Unexpected error', error: err.message };
    }
};

// Send Bulk Emails
exports.sendBulkEmails = async (emails) => {
    try {
        const results = await Promise.allSettled(
            emails.map(email => mailer.emails.send({
                from: 'Cartnest <noreply@cartnest.site>',
                ...email
            }))
        );

        const successes = results.filter(res => res.status === 'fulfilled');
        const failures = results.filter(res => res.status === 'rejected');

        return { 
            success: true, 
            message: `Bulk Email Summary: Sent - ${successes.length}, Failed - ${failures.length}`, 
            sent: successes.length, 
            failed: failures.length 
        };
    } catch (err) {
        return { success: false, message: 'Unexpected error in bulk email sending', error: err.message };
    }
};
