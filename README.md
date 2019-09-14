# CustomEmailsV2

## Description

CustomEmailsV2 produces output files in SMTP format suitable for sending personalized emails to customers with a balance on their accounts. Generated source files are prefixed with a "g". Also, generated emails are placed in a subordinate directory named "Emails". If that directory already exists, then all of its contents are removed; otherwise, the directory is created. 

## What I Learned

* How to use BASH to generate directories and files
* How to use AWK to for pattern matching and file processing
* How to use SED to transform email templates into email files suitable for personalized emails

## Testing

Several files are included for testing:  

* customer.txt
    * File containing sample input containing one customer per line
    * Each customer line contains:
        * \<email\>,\<full name\>, \<title\>,\<paid amount\>,\<owed amount\>
        * For example: 
            * petem@xyz.net,Pete Moss,Mr.,10580.00,100
            * pcorn@abc.net,Pop Corn,Col.,50,200
* template.txt
    * File containing references to variable (all caps) which should be substituted with values for each customer meeting the criteria mention above.
    * For Example:
        * EMAIL - customer email address (1st attribute)
        * TITLE - customer title (3rd attribute)
        * FULLNAME - full customer name
        * NAME - customer name 
        * AMOUNT - owe amount
        * DATE - date the payment must be received. (passed as a parameter to customEmails.pl)
    * Sample:
          
          MAIL FROM:<bill.king@croc.com>
          RCPT TO:<EMAIL>
          DATA
          From: "Bill King" <bill.king@croc.com>
          To: "FULLNAME" <EMAIL>
          Subject: Payment is Due

          Dear TITLE NAME,
          We appreciate your business with Completely Reliable Outlet Corp.  You 
          would be an even more valued customer if you will pay us $AMOUNT.  If 
          you don't pay us by DATE, we will double the amount you owe us. 

          If you have any questions regarding your account, please contact
          me at 222-555-1234.

          Bill King
          Collections Manager
          .
          
## Installation

Clone the repository wherever you like (e.g. `~/Projects/CustomEmailsV2`):  
`git clone https://github.com/gsessums/CustomEmailsV2.git`

## Usage

To execute enter the following command with date (payment deadline), then follow the on screen prompts.
`./customEmailsV2.pl mm/dd/yyyy`  

## Credits

Author: Geoffrey Sessums

## License
MIT License

Copyright (c) 2017 Geoffrey Sessums

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
