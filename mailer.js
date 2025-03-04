const {
    sendWelcomeEmail,
    sendLoginAlert,
    sendBulkEmails,
    getApiKeys,
    getAudiences,
    getEmail,
    getAllSentEmails,
    cancelEmail
} = require("./mailer/resend/resend.mailer");

(async () => {
    try {
        console.log("📩 Sending test welcome email...");
        const welcomeResponse = await sendWelcomeEmail("chkmmichael@gmail.com", "Kahuho Charles");
        console.log("Response:", welcomeResponse);

        // console.log("\n🔑 Fetching API keys...");
        // const apiKeysResponse = await getApiKeys();
        // console.log("Response:", JSON.stringify(apiKeysResponse));

        // console.log("\n👥 Fetching audiences...");
        // const audiencesResponse = await getAudiences();
        // console.log("Response:", JSON.stringify(audiencesResponse));

        // console.log("\n📨 Fetching all sent emails...");
        // const sentEmailsResponse = await getAllSentEmails();
        // console.log("Response:", sentEmailsResponse);

        // if (sentEmailsResponse.success && sentEmailsResponse.data.length > 0) {
        //     const emailId = sentEmailsResponse.data[0].id;

        //     console.log("\n📧 Fetching details of a specific email...");
        //     const emailResponse = await getEmail(emailId);
        //     console.log("Response:", emailResponse);

        //     // console.log("\n⛔ Canceling the email...");
        //     // const cancelResponse = await cancelEmail(emailId);
        //     // console.log("Response:", cancelResponse);
        // } else {
        //     console.log("\n⚠️ No emails found to test getEmail and cancelEmail.");
        // }

    } catch (error) {
        console.error("❌ Test execution failed:", error);
    }
})();
