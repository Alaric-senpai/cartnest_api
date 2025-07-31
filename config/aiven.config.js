const fs = require('fs');
const path = require('path');

const privateKeyPath = path.resolve(__dirname, '../private-key.pem');
const privateKey = fs.readFileSync(privateKeyPath, 'utf8');

module.exports = {
  privateKey,
};
