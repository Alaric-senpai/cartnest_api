class Global {
    constructor() {}

    // Generate a unique numeric code
    createUniqueCode() {
        const timestamp = Date.now();
        const randomPart = Math.floor(Math.random() * 10000).toString().padStart(4, '0');
        const uniqueCode = (timestamp % 100000000).toString().slice(-4) + randomPart;
        return parseInt(uniqueCode, 10);
    }

    // Generate a unique tracking code
    createTrackingCode(length = 30) {
        const timestamp = Date.now().toString();
        const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        let uid = timestamp;

        for (let i = 0; i < length; i++) {
            uid += chars.charAt(Math.floor(Math.random() * chars.length));
        }

        return uid;
    }
}

module.exports = new Global();
