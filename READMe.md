# CartNest API V 2.0 release
*****

## Background info
****
- Cartnest is an e-commerce platform runningon Angular Js for the frontend and Nodejs Express js for the backend
- Version 1 Release not open for public usage

## Api Background information
****
* The api consists of 9 modules namely:
    1. Auth Module
    2. Brands Module
    3. Carts Module
    4. Categories Module
    5. Generals Module
    7. Orders module
    8. Products module
    9. Shops Module

* The modules listed above are supported with the original version 1 of the api
* Version 2 aims to smoothline the existing modules and emphasize more on its secutity

## Supported routes in v1
****
### Auth module
```json
{
    "baseurl": "/cartnest/auth"
}
```
****

##### supported routes

***

```json
{
    "post routes":{
        "/register":"for user registration",
        "/login":"used for login",
        "/user/token//confirm":"confriming password reser token",
        "/user/token/send":"send password reset token",
        "/user/reset":"for password reset purpose",
        "/user/info":"fetch user information"
    }
}
```

* for respcetive routes on each module await the respective md file for each module to be added later on

***
# Authors
***

###### This madness of art was crafted by Charles Kahuho[https://github.com/Alaric-senpai]
. Attribute when used
