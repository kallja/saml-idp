# Setup

To setup SSO

  1. Generate cert & key
      * E.g. `openssl req -x509 -new -newkey rsa:2048 -nodes -subj '/C=US/ST=California/L=San Francisco/O=JankyCo/CN=Test Identity Provider' -keyout idp-private-key.pem -out idp-public-cert.pem -days 7300`
  1. Configure SSO settings in your application
      1. Add SSO Endpoint (default is `http://localhost:7000/saml/sso`)
      1. Copy the generated public cert to the application settings
  1. Start Saml Idp server with `npm run start`
      * For more configuration options see [`https://www.npmjs.com/package/saml-idp`](https://www.npmjs.com/package/saml-idp)

## Running in Docker

The docker config will generate a key-pair on first start.

To build the image:

`docker build -t saml-idp .`

To create a container of the built image and run it:

`docker run -it --name saml-idp saml-idp`

The above command outputs the generated public certificate to std-out. You may have to scroll up to reveal it. The certificate isn't renegerated on subsequent runs. It's still logged, though.

On subsequent starts, simply use:

`docker start saml-idp`