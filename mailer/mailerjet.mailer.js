const express = require('express');
const Mailjet = require('node-mailjet');

class MailjetService {
  constructor() {
    this.mailjet = Mailjet.apiConnect(
      process.env.MJ_APIKEY_PUBLIC  || "6daa128e98a1fc6e309dca4ad00debc2", 
      process.env.MJ_APIKEY_PRIVATE || "df026b891bbe7f6adede3726a7e8493f"
    );
  }

  async sendEmail(options) {
    try {
      const request = this.mailjet
        .post('send', { version: 'v3.1' })
        .request({
          Messages: [{
            From: {
              Email: options.from || 'ckagenou96@gmail.com',
              Name: options.fromName || 'Cartnest'
            },
            To: [{
              Email: options.to,
              Name: options.toName || 'Recipient'
            }],
            Subject: options.subject,
            TextPart: options.text,
            HTMLPart: options.html
          }]
        });
      const result = await request;
      return result.body;
    } catch (error) {
      console.error('Mailjet Send Error:', error);
      throw error;
    }
  }

  async sendTemplateEmail(options) {
    try {
      const request = this.mailjet
        .post('send', { version: 'v3.1' })
        .request({
          Messages: [{
            From: {
              Email: options.from || 'ckagenou96@gmail.com',
              Name: options.fromName || 'Cartnest'
            },
            To: [{
              Email: options.to,
              Name: options.toName || 'Recipient'
            }],
            TemplateID: options.templateId,
            TemplateLanguage: true,
            Variables: options.variables || {}
          }]
        });
      const result = await request;
      return result.body;
    } catch (error) {
      console.error('Mailjet Template Email Error:', error);
      throw error;
    }
  }

  async sendPasswordResetEmail(email, code) {
    try {
      const result = await this.sendTemplateEmail({
        to: email,
        templateId: 6485508, // Replace with actual Mailjet template ID for password reset
        variables: {
          code: code,
          EMAIL_TO: email
        }
      });
      return result;
    } catch (error) {
      console.error('Password Reset Email Error:', error);
      throw error;
    }
  }

  async sendWelcomeEmail(email, username) {
    try {
      const result = await this.sendTemplateEmail({
        to: email,
        templateId: 1234567, // Replace with actual Mailjet template ID for welcome email
        variables: {
          user_name: username,
          user_email: email
        }
      });
      return result;
    } catch (error) {
      console.error('Welcome Email Error:', error);
      throw error;
    }
  }

  async sendOrderPlacedEmail(email, orderDetails) {
    try {
      const result = await this.sendTemplateEmail({
        to: email,
        templateId: 9001, // Order placed template ID
        variables: {
          order_number: orderDetails.orderNumber,
          total_amount: orderDetails.totalAmount,
          items: orderDetails.items,
          shipping_address: orderDetails.shippingAddress
        }
      });
      return result;
    } catch (error) {
      console.error('Order Placed Email Error:', error);
      throw error;
    }
  }

  async sendOrderDeliveredEmail(email, orderDetails) {
    try {
      const result = await this.sendTemplateEmail({
        to: email,
        templateId: 9002, // Order delivered template ID
        variables: {
          order_number: orderDetails.orderNumber,
          delivery_date: new Date().toLocaleDateString(),
          tracking_number: orderDetails.trackingNumber
        }
      });
      return result;
    } catch (error) {
      console.error('Order Delivered Email Error:', error);
      throw error;
    }
  }

  async sendOrderCancelledEmail(email, orderDetails) {
    try {
      const result = await this.sendTemplateEmail({
        to: email,
        templateId: 9003, // Order cancelled template ID
        variables: {
          order_number: orderDetails.orderNumber,
          cancellation_reason: orderDetails.cancellationReason || 'Customer request',
          refund_amount: orderDetails.refundAmount
        }
      });
      return result;
    } catch (error) {
      console.error('Order Cancelled Email Error:', error);
      throw error;
    }
  }

  async sendOrderCompletedEmail(email, orderDetails) {
    try {
      const result = await this.sendTemplateEmail({
        to: email,
        templateId: 9004, // Order completed template ID
        variables: {
          order_number: orderDetails.orderNumber,
          completed_date: new Date().toLocaleDateString(),
          feedback_link: orderDetails.feedbackLink
        }
      });
      return result;
    } catch (error) {
      console.error('Order Completed Email Error:', error);
      throw error;
    }
  }
}

module.exports = new MailjetService();