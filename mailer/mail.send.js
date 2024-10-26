
// // const Recipient = require("mailersend").Recipient;
// // const EmailParams = require("mailersend").EmailParams;
// // const MailerSend = require("mailersend");
// const { MailerSend, EmailParams, Recipient } = await import('mailersend');

// const  apikey = 'mlsn.a0ad1be9ec081b68bca6a9d02e2f31b95a7dc5c4b6ea9a0dcd8cc02e88263e4b'


// // mail.send.js


// export const welcomeMail = async (recemail, recname, subject) => {
//     try {
//         const { MailerSend, EmailParams, Recipient } = await import('mailersend'); // Move this inside the async function
        
//         const mailersend = new MailerSend({
//             apiKey: apikey,
//         });

//         const recipients = [new Recipient(recemail, recname)];

//         const personalization = [
//             {
//                 email: recemail,
//                 data: {
//                     name: recname,
//                     support_email: 'ckcharles004@gmail.com'
//                 },
//             }
//         ];

//         const emailParams = new EmailParams()
//             .setFrom("cartnest@gmail.com")
//             .setFromName("Admin")
//             .setRecipients(recipients)
//             .setSubject(subject)
//             .setTemplateId('pr9084z9e3mlw63d') // Provide your template ID
//             .setPersonalization(personalization);

//         await mailersend.send(emailParams);
//         return {
//             message: 'Welcome email sent successfully',
//             success: true
//         };
//     } catch (error) {
//         console.error('Error sending welcome email:', error);
//         return {
//             message: 'Error sending welcome mail',
//             success: false,
//             error: error.message
//         };
//     }
// };


// // // import 'dotenv/config';
// // export const WelcomeMail = async (recemail, recname, subject, text) => {
// //     console.log(recemail, recname, subject, text)
// //     try {
// //         const { MailerSend, EmailParams, Recipient } = await import('mailersend');

// //         const mailersend = new MailerSend({
// //             apiKey: apikey,
// //         });

// //         const recipients = [new Recipient(recemail, recname)];

// //         const personalization = [
// //             {
// //                 email: recemail,
// //                 data: {
// //                     name: recname
// //                 },
// //             }
// //         ];

// //         const emailParams = new EmailParams()
// //             .setFrom("cartnest@gmail.com")
// //             .setFromName("Admin")
// //             .setRecipients(recipients)
// //             .setSubject(subject)
// //             .setTemplateId('pr9084z9e3mlw63d')
// //             .setPersonalization(personalization);

// //         await mailersend.send(emailParams);
// //         return {
// //             message: 'Welcome email sent successfully',
// //             success: true
// //         };
// //     } catch (error) {
// //         console.error('Error sending welcome email:', error);
// //         return {
// //             message: 'Error sending welcome mail',
// //             success: false,
// //             error: error.message
// //         };
// //     }
// // };
